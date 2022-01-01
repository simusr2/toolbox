import 'package:flutter/material.dart';
import 'package:toolbox/widget/NavigationDrawerWidget.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('People'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text('People'),
      ),
    );
  }
}
