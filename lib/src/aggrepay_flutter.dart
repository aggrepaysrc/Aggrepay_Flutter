import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class AggrepayFlutter {
  static const MethodChannel _channel = MethodChannel('aggrepay_flutter');

  static Future<Map<String, dynamic>> pay(Map<String, dynamic> params) async {
    final String data = await _channel.invokeMethod(
      'pay',
      {
        'url': 'https://biz.aggrepaypayments.com',
        'params': params,
      },
    );
    //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

    var decodedData = jsonDecode(data);

    String appendData = ''' 
    {
      "status":"${decodedData['status']}",
      "payment_response":${decodedData['payment_response']}
    }
    ''';
    dynamic returnData =
        Platform.isAndroid ? jsonDecode(appendData) : jsonDecode(data);
    return returnData;
  }
}
