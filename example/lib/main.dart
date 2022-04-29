// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:aggrepay_flutter/aggrepay_flutter.dart';
import 'package:aggrepay_flutter_example/payment_response.dart';
import 'package:aggrepay_flutter_example/payment_success.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xff209366,
          <int, Color>{
            50: Color(0xff209366),
            100: Color(0xff209366),
            200: Color(0xff209366),
            300: Color(0xff209366),
            400: Color(0xff209366),
            500: Color(0xff209366),
            600: Color(0xff209366),
            700: Color(0xff209366),
            800: Color(0xff209366),
            900: Color(0xff209366),
          },
        ),
      ),
      home: _AppState(),
    );
  }
}

class _AppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_AppState> {
  TextEditingController amountController = TextEditingController();
  TextEditingController orderController = TextEditingController();

  String paymentResponse = "";

  String api_key = 'your api key';
  String hash = '';
  String order_id = '23';
  String mode = 'TEST';
  String description = 'test';
  String currency = 'INR';
  String amount = '28';
  String name = 'Username';
  String email = 'user@gmail.com';
  String phone = '8123456789';
  String city = 'usercity';
  String state = 'user state';
  String country = 'IND';
  String zip_code = 'user pin code';
  String address_line_1 = 'user address';
  String address_line_2 = '';
  String udf1 = '';
  String udf2 = '';
  String udf3 = '';
  String udf4 = '';
  String udf5 = '';
  String return_url = 'return url';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Aggrepay Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              decoration: InputDecoration(
                hintText: 'Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: orderController,
              decoration: InputDecoration(
                hintText: 'Order Id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  order_id = orderController.text;
                  amount = amountController.text;
                });

                createHash(amountController.text, orderController.text);
                Map<String, String> params = {
                  'api_key': api_key,
                  'hash': hash,
                  'order_id': order_id,
                  'mode': mode.toUpperCase(),
                  'description': description,
                  'currency': currency,
                  'amount': amount,
                  'name': name,
                  'email': email,
                  'phone': phone,
                  'city': city,
                  'state': state,
                  'country': country,
                  'zip_code': zip_code,
                  'address_line_1': address_line_1,
                  'return_url': return_url
                };
                open(params);
              },
              child: Text('Pay Now'.toUpperCase()),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 55),
                ),
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void open(Map<String, dynamic> params) async {
    try {
      final response = await AggrepayFlutter.pay(params);
      log("Response :" + response.toString());
      PaymentResponse data = PaymentResponse.fromJson(response);
      if (data.status.toString().contains('success')) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PaymentSuccess(paymentResponse: data),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Transaction failed!'),
            backgroundColor: Colors.black,
          ),
        );
      }
    } on PlatformException catch (exception) {
      log(exception.message.toString());
    }
  }

  void createHash(String amount, String order) {
    var params = {
      'api_key': api_key,
      'hash': hash,
      'order_id': orderController.text,
      'mode': mode,
      'description': description,
      'currency': currency,
      'amount': amountController.text,
      'name': name,
      'email': email,
      'phone': phone,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zip_code,
      'address_line_1': address_line_1,
      'return_url': return_url
    };

    List _hashList = [
      "address_line_1",
      "amount",
      "api_key",
      "city",
      "country",
      "currency",
      "description",
      "email",
      "mode",
      "name",
      "zip_code",
      "order_id",
      "phone",
      "return_url",
      "state",
    ];

    _hashList.sort();

    var hashData = 'your salt key';
    for (int i = 0; i < _hashList.length; i++) {
      if (params.keys.contains(_hashList[i])) {
        if (params[_hashList[i]].toString().isNotEmpty) {
          hashData += '|' + params[_hashList[i]]!.trim().toString();
        }
      }
    }

    var hashed = sha512.convert(utf8.encode(hashData.toString()));
    setState(() {
      hash = hashed.toString().toUpperCase();
    });
  }
}
