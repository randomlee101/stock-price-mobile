import 'package:flutter/material.dart';
import 'package:stock_market/model/model.dart';
import 'package:stock_market/ui/stock_view.dart';

class SearchView extends SearchDelegate<StockModel> {
  final List<StockModel>? stocks;

  SearchView({this.stocks});

  @override
  Widget buildSuggestions(BuildContext context) {
    List<StockModel>? suggestions = stocks
        ?.where(
            (stock) => stock.symbol.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: suggestions?.length ?? 0,
        itemBuilder: (context, index) => StockView(
              stock: suggestions![index],
            ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = "";
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<StockModel>? result = stocks
        ?.where(
            (stock) => stock.symbol.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: result?.length ?? 0,
        itemBuilder: (context, index) => StockView(
              stock: result![index],
            ));
  }
}
