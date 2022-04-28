// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:aggrepay_flutter/aggrepay_flutter.dart';

// void main() {
//   const MethodChannel channel = MethodChannel('aggrepay_flutter');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await AggrepayFlutter.platformVersion, '42');
//   });
// }
