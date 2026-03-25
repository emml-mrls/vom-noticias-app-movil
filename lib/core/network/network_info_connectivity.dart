import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:vom_app/core/network/i_network_info.dart';

class NetworkInfoConnectivity implements INetworkInfo{
  @override
  Future<bool> get isConnected async => await Connectivity().checkConnectivity() != ConnectivityResult.none;
}