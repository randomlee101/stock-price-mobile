// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockModel _$$_StockModelFromJson(Map<String, dynamic> json) =>
    _$_StockModel(
      (json['open'] as num).toDouble(),
      (json['high'] as num).toDouble(),
      (json['low'] as num).toDouble(),
      (json['close'] as num).toDouble(),
      (json['volume'] as num).toDouble(),
      (json['adj_high'] as num).toDouble(),
      (json['adj_low'] as num).toDouble(),
      (json['adj_close'] as num).toDouble(),
      (json['adj_open'] as num).toDouble(),
      (json['adj_volume'] as num).toDouble(),
      (json['split_factor'] as num).toDouble(),
      (json['dividend'] as num).toDouble(),
      json['symbol'] as String,
      json['exchange'] as String,
      json['date'] as String,
    );

Map<String, dynamic> _$$_StockModelToJson(_$_StockModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
      'adj_high': instance.adj_high,
      'adj_low': instance.adj_low,
      'adj_close': instance.adj_close,
      'adj_open': instance.adj_open,
      'adj_volume': instance.adj_volume,
      'split_factor': instance.split_factor,
      'dividend': instance.dividend,
      'symbol': instance.symbol,
      'exchange': instance.exchange,
      'date': instance.date,
    };
