import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

class MainServices extends ChangeNotifier {
  final String _rpcUrl = 'http://127.0.0.1:7545';
  final String _wsUrl = 'ws://127.0.0.1:7545';
  final String driverPrivateKey =
      '4395478c340cc700166039a04b60940df00b11a77b963d8e6d644dfc4155b588';
  final String userPrivateKey =
      'c4461f08392a2b133474add96ec4936f7d7f08d4236f17f68cc4d889b9e6fc80';
  late Web3Client _web3client;
  MainServices() {
    init();
  }

  Future<void> init() async {
    _web3client = Web3Client(
      _rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
    await getABI();
    await getCredentials();
    await getDeployedContract();
  }

  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  Future<void> getABI() async {
    String abiFile = await rootBundle.loadString('build/contracts/Main.json');
    var jsonABI = jsonDecode(abiFile);
    _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'Main');
    _contractAddress =
        EthereumAddress.fromHex(jsonABI["networks"]["5777"]["address"]);
  }

  late EthPrivateKey userCredentials;
  late EthPrivateKey driverCredentials;
  Future<void> getCredentials() async {
    userCredentials = EthPrivateKey.fromHex(userPrivateKey);
    driverCredentials = EthPrivateKey.fromHex(driverPrivateKey);
  }

  late DeployedContract _deployedContract;
  late ContractFunction _startJourney;
  late ContractFunction _endJourney;
  late ContractFunction _transfer;

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
    _startJourney = _deployedContract.function('startJourney');
    _endJourney = _deployedContract.function('endJourney');
    _transfer = _deployedContract.function('transfer');
  }
}
