import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

final msProvider =
    ChangeNotifierProvider<MainServices>((ref) => MainServices());

class MainServices extends ChangeNotifier {
  late StreamSubscription _driverAddedSubscription;
  late StreamSubscription _priceAddedSubscription;

  final String _rpcUrl = 'http://192.168.0.106:7545';
  final String _wsUrl = 'ws://192.168.0.106:7545';
  final String driverPrivateKey =
      '0x989aaecd3f6e7720f485bc0bf6e671d2bd59bba0602581b0cddb69b304902a14';
  final String userPrivateKey =
      '0xf0d108e2352f4f28e614e01c53f43adeb80a7ea8adce4027f3299e455d9e0397';
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
        EthereumAddress.fromHex('0xD9259875A3f7afBF23c792F409177f5403ff70F2');
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
  late ContractFunction _sayHello;
  late ContractFunction _getActiveRequests;
  late ContractFunction _registerAsDriver;

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
    _registerAsPassenger = _deployedContract.function('registerAsPassenger');
    _addRequest = _deployedContract.function('createActiveRequest');
    _fetchDrivers = _deployedContract.function('fetchDrivers');
    _fetchPrices = _deployedContract.function('fetchPrices');
    _sayHello = _deployedContract.function('sayHello');
    _getActiveRequests = _deployedContract.function('getActiveRequests');
    _registerAsDriver = _deployedContract.function('registerAsDriver');
  }

  Future<void> createActiveRequest(
      String pickUp, String dropOff, int distance) async {
    try {
      // Encode the function parameters
      final response = await _web3client.call(
        contract: _deployedContract,
        function: _addRequest,
        params: [pickUp, dropOff, BigInt.from(distance)],
        sender: userCredentials.address,
      );
      debugPrint('Active request created: $response');
    } catch (e) {
      debugPrint('Error creating active request: $e');
    }
  }

  Future<Map> getActiveRequests() async {
    try {
      // Encode the function parameters
      final response = await _web3client.call(
        contract: _deployedContract,
        function: _getActiveRequests,
        params: [],
      );
      debugPrint('Active request created: $response');
      return {};
    } catch (e) {
      debugPrint('Error creating active request: $e');
    }

    return {};
  }

  Future<void> hello() async {
    try {
      // Encode the function parameters
      final response = await _web3client.call(
        contract: _deployedContract,
        function: _registerAsPassenger,
        params: [],
      );

      debugPrint('User registered: $response');
    } catch (e) {
      debugPrint('Error creating active request: $e');
    }
  }

  Future<void> register(String name, String phonenumber) async {
    try {
      // Encode the function parameters
      final response = await _web3client.call(
        contract: _deployedContract,
        function: _registerAsPassenger,
        params: [name, phonenumber],
      );

      debugPrint('User registered: $response');
    } catch (e) {
      debugPrint('Error registering user: $e');
    }
  }

  Future<void> registerDriver(String name, String phonenumber, String carnumber,
      String licensenumber) async {

    try {
      // Encode the function parameters
      final response = await _web3client.call(
        contract: _deployedContract,
        function: _registerAsDriver,
        params: [name, phonenumber, carnumber, licensenumber],
      );
      debugPrint('User registered: $response');
    } catch (e) {

      debugPrint('Error registering user: $e');
    }
  }
}
