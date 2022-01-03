import 'package:flutter/material.dart';
import 'package:toolbox/widget/NavigationDrawerWidget.dart';

class PingPage extends StatelessWidget {
  const PingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Ping'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('Ping'),
      ),
    );
  }
}
