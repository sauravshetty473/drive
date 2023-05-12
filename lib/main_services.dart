import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

class MainServices extends ChangeNotifier {
  late StreamSubscription _driverAddedSubscription;
  late StreamSubscription _priceAddedSubscription;

  final String _rpcUrl = 'http://127.0.0.1:7545';
  final String _wsUrl = 'ws://127.0.0.1:7545';
  final String driverPrivateKey =
      '275ac7d4d9c90b601272f8ab1baee5f4775ce97081a07eb41aad9cac3a209ae6';
  final String userPrivateKey =
      '82640a96935cbf4bbb6d5cd87c4a931ec7b21db647788de5947849856f587ea9';
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
    String abiFile = await rootBundle.loadString('build/contracts/Drive.json');
    var jsonABI = jsonDecode(abiFile);
    _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'Drive');
    _contractAddress =
        EthereumAddress.fromHex('0x57d0e2e7f14f4f3b19f15ba8789a270ef97755a3');
  }

  late EthPrivateKey userCredentials;
  late EthPrivateKey driverCredentials;
  Future<void> getCredentials() async {
    userCredentials = EthPrivateKey.fromHex(userPrivateKey);
    driverCredentials = EthPrivateKey.fromHex(driverPrivateKey);
  }

  late DeployedContract _deployedContract;
  late ContractFunction _registerAsPassenger;
  late ContractFunction _addRequest;
  late ContractFunction _fetchDrivers;
  late ContractFunction _fetchPrices;

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
    _registerAsPassenger = _deployedContract.function('registerAsPassenger');
    _addRequest = _deployedContract.function('createActiveRequest');
    _fetchDrivers = _deployedContract.function('fetchDrivers');
    _fetchPrices = _deployedContract.function('fetchPrices');
  }

  Future<void> createActiveRequest(
      String pickUp, String dropOff, int distance) async {
    try {
      // Encode the function parameters
      final response = await _web3client.call(
        contract: _deployedContract,
        function: _addRequest,
        params: [
          utf8.encode(pickUp),
          utf8.encode(dropOff),
          BigInt.from(distance)
        ],
      );
      debugPrint('Active request created: $response');
    } catch (e) {
      debugPrint('Error creating active request: $e');
    }
  }
}
