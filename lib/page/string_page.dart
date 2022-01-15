import 'package:flutter/material.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';
import 'dart:convert';

class StringPage extends StatefulWidget {
  const StringPage({Key? key}) : super(key: key);

  @override
  State<StringPage> createState() => _StringPageState();
}

class _StringPageState extends State<StringPage> {
  final TextEditingController _encodedTextController = TextEditingController();
  final TextEditingController _decodedTextController = TextEditingController();

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
        title: const Text('String'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text("Base64"),
                const Text("Decoded text (clear text)"),
                TextField(
                  maxLines: 3,
                  controller: _decodedTextController,
                ),
                const SizedBox(height: 16.0),
                const Text("Encoded text (base64 text)"),
                TextField(
                  maxLines: 3,
                  controller: _encodedTextController,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            onPressed: onEncodePressed,
                            child: const Text('Encode')),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            onPressed: onDecodePressed,
                            child: const Text('Decode')),
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            )),
      ),
    );
  }

  void onEncodePressed() {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String decodedText = _decodedTextController.text;
    String encodedText = stringToBase64.encode(decodedText);
    _encodedTextController.text = encodedText;
  }

  void onDecodePressed() {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedText = _encodedTextController.text;
    String decodedText = stringToBase64.decode(encodedText);
    _decodedTextController.text = decodedText;
  }
}
