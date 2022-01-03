import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<String> getDeviceModel() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final BaseDeviceInfo baseDeviceInfo = await deviceInfo.deviceInfo;
  final String baseDeviceInfoString = 'Unknown ${baseDeviceInfo.runtimeType}';
  switch (baseDeviceInfo.runtimeType.toString()) {
    case 'AndroidDeviceInfo':
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model ?? baseDeviceInfoString;
    case 'IosDeviceInfo':
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine ?? baseDeviceInfoString;
    case 'WebDeviceInfo':
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      // TODO: return userAgent?
      return webBrowserInfo.browserName
          .toString(); // Safari, Chrome, Firefox, Edge, IE, Opera, etc.
    // TODO: windows, macOs, linux?
    default:
      return baseDeviceInfoString;
  }
}

Future<Map<String, dynamic>> getDeviceInfoMap() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  debugPrint(deviceInfo.runtimeType.toString());
  debugPrint(deviceInfo.toString());
  final map = deviceInfo.toMap();
// Push [map] to your service.
  return map;
}
