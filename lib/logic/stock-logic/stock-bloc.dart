import 'package:rxdart/rxdart.dart';
import 'package:stock_market/logic/logic.dart';
import 'package:stock_market/model/model.dart';

class StockBLoC
{
    final BehaviorSubject<String?> _date = BehaviorSubject<String?>();
    final BehaviorSubject<List<StockModel>> _stocks = BehaviorSubject<List<StockModel>>();

    Stream<String?> get date => _date.stream.distinct();
    Stream<List<StockModel>> get stocks => _stocks.stream.distinct();

    String? get getDate => _date.valueOrNull;
    addDate(String? e) async {
      _date.sink.add(e);
      StockRequest _stockRequest = StockRequest();
      await _stockRequest.fetchStockHistory();
    }
    addStocks(List<StockModel> e) => _stocks.sink.add(e);

    dispose()
    {
      addDate(null);
      addStocks([]);
    }
}