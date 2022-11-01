import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stock_market/main.dart';

class NetworkLogic {
  static startListeningToNetworkStatus() {
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((event) {
      scaff.currentState?.clearSnackBars();
      if (event == ConnectivityResult.none) {
        scaff.currentState?.showSnackBar(const SnackBar(
          content: Text("Network Unavailable"),
          backgroundColor: Colors.red,
          duration: Duration(minutes: 15),
        ));
      } else {
        scaff.currentState?.showSnackBar(const SnackBar(
          content: Text("Network Available"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ));
      }
    });
  }
}
