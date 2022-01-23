import 'package:flutter/material.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';

class StringLengthPage extends StatefulWidget {
  const StringLengthPage({Key? key}) : super(key: key);

  @override
  State<StringLengthPage> createState() => _StringLengthPageState();
}

class _StringLengthPageState extends State<StringLengthPage> {
  int stringLength = 0;
  String stringLengthText = "0";

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('String Length'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    maxLines: null,
                    onChanged: calculateLength,
                  ),
                  const SizedBox(height: 16.0),
                  Text(stringLengthText),
                  const Divider(),
                ],
              )),
        ),
      ),
    );
  }

  void calculateLength(String text) {
    setState(() {
      stringLength = text.length;
      stringLengthText = "Length: " + stringLength.toString();
    });
  }
}
