import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';
import 'dart:convert';

import 'package:flutter_downloader/flutter_downloader.dart';

class FileBase64Page extends StatefulWidget {
  const FileBase64Page({Key? key}) : super(key: key);

  @override
  State<FileBase64Page> createState() => _FileBase64PageState();
}

class _FileBase64PageState extends State<FileBase64Page> {
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
        title: const Text('Base64 File'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                              child: const Text('Download decoded')),
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

  Future<void> onDecodeBase64Pressed() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize(
        debug: true // optional: set false to disable printing logs to console
        );

    // final Uint8List decodedBytes =
    //     base64Decode(_encodedBase64TextController.text);
    // File file = File("file.png");
    // file.writeAsBytesSync(decodedBytes);

    final url = "data:plain/text;base64,Q2lhbw==";

    final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: 'file.txt',
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
        saveInPublicStorage: true);
  }

  void onDecodeBase64UrlPressed() {
    List<int> base64decoded =
        base64Url.decode(_encodedBase64TextController.text);
    _decodedBase64TextController.text = utf8.decode(base64decoded);
  }
}
