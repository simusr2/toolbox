import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:toolbox/implementation/connectivity_plus.dart';
import 'package:toolbox/implementation/ipify.dart';
import 'package:toolbox/widget/navigation_drawer_widget.dart';

class NetworkInfoPage extends StatefulWidget {
  const NetworkInfoPage({Key? key}) : super(key: key);

  @override
  State<NetworkInfoPage> createState() => _NetworkInfoPageState();
}

class _NetworkInfoPageState extends State<NetworkInfoPage> {
  String _connectionStatus = 'Unknown';
  StreamSubscription<ConnectivityResult>? _connectivityListener;
  String _ipv4 = '';
  String _ipv6 = '';


  @override
  initState() {
    super.initState();

    getConnectionStatus().then((ConnectivityResult connectionStatus) {
      setState(() {
        _connectionStatus = getConnectionStatusString(connectionStatus);
      });
    });

    _connectivityListener = listenConnectivityChange((result) => {
          setState(() {
            _connectionStatus = getConnectionStatusString(result);
          })
        });

    getIpv64().then((value) => {
      setState((){
        _ipv6 = value;
      })
    });


    getIpv4().then((value) => {
      setState((){
        _ipv4 = value;
      })
    });
  }

  @override
  dispose() {
    super.dispose();
    if (_connectivityListener != null) {
      disposeConnectivityChangeListener(
          _connectivityListener as StreamSubscription<ConnectivityResult>);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Network info'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Network info'),
            Text('Connection status: $_connectionStatus'),
            SelectableText('Public IPv4: $_ipv4'),
            SelectableText('Public IPv4/IPv6: $_ipv6'),
          ],
        ),
      ),
    );
  }
}
