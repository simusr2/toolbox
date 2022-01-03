import 'package:flutter/material.dart';
import 'package:toolbox/widget/NavigationDrawerWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
