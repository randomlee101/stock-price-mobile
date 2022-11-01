import 'package:flutter/material.dart';
import 'package:stock_market/model/model.dart';

class StockView extends StatelessWidget {
  const StockView({Key? key, this.stock}) : super(key: key);

  final StockModel? stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.green.shade300,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${stock?.symbol}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                  Text("${stock?.exchange}"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${stock?.close}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                  Text("${stock?.dividend} %"),
                ],
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text("Open"),
                  Text("${stock?.open}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                ],
              ),
              Column(
                children: [
                  const Text("High"),
                  Text("${stock?.high}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                ],
              ),
              Column(
                children: [
                  const Text("Low"),
                  Text("${stock?.high}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
