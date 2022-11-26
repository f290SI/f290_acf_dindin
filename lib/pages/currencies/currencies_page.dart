import 'package:f290_acf_dindin/model/currency.dart';
import 'package:f290_acf_dindin/service/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CurrenciesPage extends StatelessWidget {
  CurrenciesPage({super.key});

  final service = CurrencyService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: service.getCurrencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox(
            height: 200,
            width: 200,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScaleParty,
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
              ],
            ),
          ));
        }
        if (snapshot.hasError) {
          return Container(
            color: Colors.red,
            child: Center(
                child: Text(
              snapshot.error.toString(),
              style: const TextStyle(
                color: Colors.white12,
                fontSize: 36,
              ),
            )),
          );
        }

        var currencies = snapshot.data;

        return ListView.builder(
            itemCount: currencies!.length,
            itemBuilder: ((context, index) {
              Currency currency = currencies[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading:
                      CircleAvatar(child: Text(currency.name.substring(0, 3))),
                  title: Text(currency.name),
                  subtitle: Text.rich(TextSpan(children: [
                    TextSpan(text: 'Buy: ${currency.buy.toStringAsFixed(2)}'),
                    TextSpan(
                        text: ' Sell: ${currency.sell.toStringAsFixed(2)}'),
                    TextSpan(
                        text:
                            ' Variation: ${currency.variation.toStringAsFixed(2)}'),
                  ])),
                ),
              );
            }));
      },
    );
  }
}
