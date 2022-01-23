import 'package:flutter/material.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';
import 'dart:convert';

class StringBase64Page extends StatefulWidget {
  const StringBase64Page({Key? key}) : super(key: key);

  @override
  State<StringBase64Page> createState() => _StringBase64PageState();
}

class _StringBase64PageState extends State<StringBase64Page> {
  final TextEditingController _encodedBase64TextController =
      TextEditingController();
  final TextEditingController _decodedBase64TextController =
      TextEditingController();

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
        title: const Text('Base64'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text("Decoded text (clear text)"),
                  TextField(
                    maxLines: 6,
                    controller: _decodedBase64TextController,
                  ),
                  const SizedBox(height: 16.0),
                  const Text("Encoded text (base64 text)"),
                  TextField(
                    maxLines: 6,
                    controller: _encodedBase64TextController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                              onPressed: onEncodeBase64Pressed,
                              child: const Text('Encode')),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                              onPressed: onDecodeBase64Pressed,
                              child: const Text('Decode')),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Divider(),
                ],
              )),
        ),
      ),
    );
  }

  void onEncodeBase64Pressed() {
    List<int> utf8encoded = utf8.encode(_decodedBase64TextController.text);
    _encodedBase64TextController.text = base64.encode(utf8encoded);
  }

  void onEncodeBase64UrlPressed() {
    List<int> utf8encoded = utf8.encode(_decodedBase64TextController.text);
    _encodedBase64TextController.text = base64Url.encode(utf8encoded);
  }

  void onDecodeBase64Pressed() {
    List<int> base64decoded = base64.decode(_encodedBase64TextController.text);
    _decodedBase64TextController.text = utf8.decode(base64decoded);
  }

  void onDecodeBase64UrlPressed() {
    List<int> base64decoded =
        base64Url.decode(_encodedBase64TextController.text);
    _decodedBase64TextController.text = utf8.decode(base64decoded);
  }
}
