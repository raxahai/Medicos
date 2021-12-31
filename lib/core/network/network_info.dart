import 'package:test_me/core/network/connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementation implements NetworkInfo {
  final ConnectionChecker connectionChecker;

  NetworkInfoImplementation(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
