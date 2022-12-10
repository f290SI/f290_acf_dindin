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
              colors: [
                Colors.amberAccent,
              ],
              indicatorType: Indicator.lineSpinFadeLoader,
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
                  leading: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      child: Text(
                        currency.name.substring(0, 3),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      )),
                  title: Text(currency.name),
                  subtitle: Text.rich(TextSpan(children: [
                    TextSpan(text: 'Buy: ', children: [
                      TextSpan(
                          text: currency.buy.toStringAsFixed(2),
                          style: const TextStyle(fontWeight: FontWeight.w600))
                    ]),
                    TextSpan(text: ' - Sell: ', children: [
                      TextSpan(
                          text: currency.sell.toStringAsFixed(2),
                          style: const TextStyle(fontWeight: FontWeight.w600))
                    ]),
                    TextSpan(text: ' - Variation: ', children: [
                      TextSpan(
                          text: currency.variation.toStringAsFixed(2),
                          style: const TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  ])),
                ),
              );
            }));
      },
    );
  }
}
