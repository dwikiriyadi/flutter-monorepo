import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChecker {
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    switch (connectivityResult) {
      case ConnectivityResult.none:
        return false;
      default:
        return await InternetConnectionChecker().hasConnection;
    }
  }
}
