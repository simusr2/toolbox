import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';

class PricePerKgPage extends StatefulWidget {
  const PricePerKgPage({Key? key}) : super(key: key);

  @override
  State<PricePerKgPage> createState() => _PricePerKgPageState();
}

class _PricePerKgPageState extends State<PricePerKgPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _pricePerKgController = TextEditingController();

  @override
  initState() {
    super.initState();

    _weightController.addListener(_calculatePricePerKg);
    _priceController.addListener(_calculatePricePerKg);
  }

  @override
  dispose() {
    super.dispose();
  }

  void _calculatePricePerKg() {
    final bool emptyWeight = _weightController.value.text.isEmpty;
    final bool emptyPrice = _priceController.value.text.isEmpty;

    if (emptyPrice || emptyWeight) {
      _pricePerKgController.text = '';
    } else {
      try {
        final double weight = double.parse(_weightController.value.text);
        final double price = double.parse(_priceController.value.text);
        final double pricePerKg = price * 1000 / weight;

        _pricePerKgController.text = '$pricePerKg';
      } on FormatException {
        _pricePerKgController.text = 'Format error';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Price per KG'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //Row(children: [
                  TextFormField(
                    controller: _weightController,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                    ],
                  ),
                  const Text(" g "),
                  //]),
                  // Row(children: [
                  TextFormField(
                    controller: _priceController,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                    ],
                  ),
                  const Text(" € "),
                  // ]),
                  const SizedBox(height: 16.0),
                  const Text("€/kg (1000 g)"),
                  TextField(
                    controller: _pricePerKgController,
                    readOnly: true,
                  ),
                  const Divider(),
                ],
              )),
        ),
      ),
    );
  }
}
