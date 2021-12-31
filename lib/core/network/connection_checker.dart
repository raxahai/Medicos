import 'dart:io';

class ConnectionChecker {
  final CustomInternetAddress internetAddress;

  ConnectionChecker(this.internetAddress);
  Future<bool> get hasConnection async {
    try {
      final result = await internetAddress.lookUp('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      }
      return Future.value(false);
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }
}

class CustomInternetAddress {
  Future<List<InternetAddress>> lookUp(String host,
      {InternetAddressType type = InternetAddressType.any}) async {
    final result = await InternetAddress.lookup(host, type: type);
    return result;
  }
}
