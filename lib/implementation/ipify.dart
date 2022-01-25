import 'package:dart_ipify/dart_ipify.dart';

Future<String> getIpv4() async{
  final String ipv4 = await Ipify.ipv4();
  // print(ipv4); // 98.207.254.136
  return ipv4;

}
Future<String> getIpv64() async {
  final ipv64 = await Ipify.ipv64();
  // print(ipv6); // 98.207.254.136 or 2a00:1450:400f:80d::200e
  return ipv64;
}