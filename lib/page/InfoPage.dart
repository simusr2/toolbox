import 'package:flutter/material.dart';
import 'package:toolbox/implementation/DeviceInfoPlus.dart';
import 'package:toolbox/widget/NavigationDrawerWidget.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) async {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Toolbox - Info'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Title(color: Colors.black, child: const Text("Toolbox")),
            Text(getDeviceModel()))
            const Text(
              "Version: 1.0.0",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
