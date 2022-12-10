import 'package:flutter/material.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({super.key});

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  @override
  Widget build(BuildContext context) {
    //TODO: Apresentar os valores das açoes utilizando ListView ou GridView, voce pode utilizar a CurrencyPage como base ou o Grid do MovieDB.
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Em desenvolvimento...',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
