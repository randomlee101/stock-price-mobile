import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_market/logic/logic.dart';
import 'package:stock_market/model/model.dart';
import 'package:stock_market/service_locator.dart';
import 'package:stock_market/ui/search_view.dart';
import 'package:stock_market/ui/stock_view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final StockBLoC _stockBLoC = locator.get<StockBLoC>();
  final StockRequest _stockRequest = StockRequest();

  @override
  Widget build(BuildContext context) {
    _stockRequest
        .fetchStockHistory()
        .then((value) => _stockBLoC.addStocks(value));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock History"),
      ),
      body: StreamBuilder(
          stream: _stockBLoC.stocks,
          builder: (context, snapshot) {
            while (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<StockModel>? stocks = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: StreamBuilder<String?>(
                            stream: _stockBLoC.date,
                            builder: (context, dateshot) {
                              return Text(dateshot.hasData
                                  ? DateFormat('dd LLLL, yyyy')
                                      .format(DateFormat('yyyy-MM-dd').parse(dateshot.data!))
                                  : "Latest");
                            }),
                      ),
                      IconButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime.now());
                            if (date == null) return;
                            String parsedDate = DateFormat('yyyy-MM-dd').format(date);
                            print(parsedDate);
                            _stockBLoC.addDate(parsedDate);
                          },
                          icon: const Icon(Icons.calendar_today)),
                      IconButton(
                          onPressed: () {
                            showSearch(
                                context: context,
                                delegate: SearchView(stocks: snapshot.data));
                          },
                          icon: const Icon(Icons.search))
                    ],
                  ),
                ),
                Visibility(
                  visible: stocks?.isNotEmpty ?? false,
                  replacement: const Expanded(
                    child: Center(
                      child: Text("No History Found"),
                    ),
                  ),
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: stocks?.length ?? 0,
                        itemBuilder: (context, index) => StockView(
                              stock: stocks![index],
                            )),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
