import 'package:flutter/material.dart';
import 'package:stock_market/logic/logic.dart';
import 'package:stock_market/service_locator.dart';

import 'ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeSingletons();
  NetworkLogic.startListeningToNetworkStatus();
  runApp(const MyApp());
}

GlobalKey<ScaffoldMessengerState> scaff = GlobalKey();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaff,
      home: Home(),
      theme: ThemeData(
          fontFamily: 'monospace',
          appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16))),
    );
  }
}
