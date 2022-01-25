import 'package:flutter/material.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';
import 'package:internet_speed_test/internet_speed_test.dart';


class SpeedtestPage extends StatefulWidget {
  const SpeedtestPage({Key? key}) : super(key: key);

  @override
  State<SpeedtestPage> createState() => _SpeedtestPageState();
}

class _SpeedtestPageState extends State<SpeedtestPage> {
  String _speedtestStatus = 'Stopped';
  double _downloadRate = 0;
  SpeedUnit _downloadUnit = SpeedUnit.Mbps;

  @override
  initState() {
    super.initState();

    final internetSpeedTest = InternetSpeedTest();

    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        // TODO: Change UI
        _speedtestStatus = 'Download test done. Results: $transferRate $unit.';

        _downloadRate = transferRate;
        _downloadUnit = unit;

        internetSpeedTest.startUploadTesting(onDone: (double transferRate, SpeedUnit unit) {
              // TODO: Change UI
setState((){
              _speedtestStatus =
              'Test done. Results: DOWN $_downloadRate $_downloadUnit. UP $transferRate $unit.';
           }
 },
            onProgress: (double percent, double transferRate, SpeedUnit unit) {
          // TODO: Change UI
setState((){
          _speedtestStatus = 'Upload test results: $_downloadRate $_downloadUnit. Upload test: current value: $transferRate $unit.';
        }
}, onError: (String errorMessage, String speedTestError) {
          // TODO: Show toast error
setState((){
          _speedtestStatus = 'Upload test error: $errorMessage. $speedTestError';
     }
   });
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        // TODO: Change UI
setState((){
        _speedtestStatus = 'Download test: $percent %. Current value: $transferRate $unit.';
  }    },
      onError: (String errorMessage, String speedTestError) {
        // TODO: Show toast error
setState((){
        _speedtestStatus = 'Download test error: $errorMessage. $speedTestError';
    }  },
    );
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
        title: const Text('Speedtest'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SelectableText(_speedtestStatus)
          ],
        ),
      ),
    );
  }
}
