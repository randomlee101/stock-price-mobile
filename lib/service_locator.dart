import 'package:get_it/get_it.dart';
import 'package:stock_market/logic/logic.dart';

GetIt locator = GetIt.instance;

initializeSingletons()
{
    locator.registerLazySingleton(() => StockBLoC());
}