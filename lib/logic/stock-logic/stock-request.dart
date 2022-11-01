import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_market/logic/logic.dart';
import 'package:stock_market/main.dart';
import 'package:stock_market/model/model.dart';
import 'package:stock_market/service_locator.dart';

class StockRequest {
  final StockBLoC _stockBLoC = locator.get<StockBLoC>();
  String BASE_URL = 'http://api.marketstack.com/v1/eod';
  String symbols = "AAPL,GOOG,MSFT,AMZN,NFLX,TSLA,META,TWTR,HULU,SMSN.IL";
  String API_KEY = "";
  String get date => _stockBLoC.getDate ?? "latest";

  Future<List<StockModel>> fetchStockHistory() async {
    String parameters = '?access_key=$API_KEY&limit=10&symbols=$symbols';
    List<StockModel> stock_history = [];
    Uri uri = Uri.parse('$BASE_URL/$date$parameters');
    try {
      var response = await http.get(uri).timeout(const Duration(seconds: 15));
      print(response.body);
      if (response.statusCode != 200) throw jsonDecode(response.body)['error']['message'];
      var data = jsonDecode(response.body)['data'] as List;
      stock_history =
          data.map<StockModel>((e) => StockModel.fromJson(e)).toList();
    } catch (e) {
      scaff.currentState?.showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return stock_history;
  }
}
