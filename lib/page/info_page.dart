import 'package:flutter/material.dart';
import 'package:toolbox/implementation/device_info_plus.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final Map<String, dynamic> deviceData = await getPlatformInfo();

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SelectableText(
              "Toolbox",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Text("Version: 1.0.1"),
            Text("Device: ${getPlatformString()}"),
            const Divider(height: 10),
            const Text("Device Info",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children:
                  _deviceData.entries.map((MapEntry<String, dynamic> entry) {
                String key = entry.key;
                String value = entry.value.toString();

                key = key.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
                  return " " + (match.group(0) ?? "");
                });
                key = "${key[0].toUpperCase()}${key.substring(1)}";

                return Row(
                  children: [
                    Expanded(
                      child: Wrap(children: [
                        Text(key,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const Text(": "),
                        SelectableText(value),
                      ]),

                      // Text(
                      //   '${entry.key}: ${entry.value}',
                      //   style: const TextStyle(fontWeight: FontWeight.bold),
                      // ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
