import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock-model.freezed.dart';

part 'stock-model.g.dart';

@Freezed()
class StockModel with _$StockModel {
  factory StockModel(
      double open,
      double high,
      double low,
      double close,
      double volume,
      double adj_high,
      double adj_low,
      double adj_close,
      double adj_open,
      double adj_volume,
      double split_factor,
      double dividend,
      String symbol,
      String exchange,
      String date) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$_StockModel.fromJson(json);
}
