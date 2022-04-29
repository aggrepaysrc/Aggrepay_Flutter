# Aggrepay Flutter
Flutter plugin for Aggrepay SDK,

* Getting Started
* Prerequisites
* Installation
* Requirements
* Usage

## Getting Started:
This flutter plugin is a wrapper around native Android and iOS SDKs.
To know more about aggrepay flutter sdk payment flow and steps, read up here : <aggrepay flutter documentation link>

## Prerequisites:
Learn about the aggrepay payment flow.
Signup in Aggrepay website and contact the aggerpay team to get a API key and Salt Key.

## Installation:
Add this to dependencies in your pubspec.yaml file.

     aggrepay_flutter: ^0.0.1

## Requirements
* Add Theme Compat
The aggrepay SDK requires that you add the theme compat in your AndroidManifest.xml file

     <application
           android:theme=”@style/Theme.AppCompat.Light”>

* Add Dependency in app level “build.gradle” file
Open the build.gradle file in your project. To open the build.gradle file, in your root  folder Android => app => src => build.gradle.

     Dependencies{
       implementation 'androidx.appcompat:appcompat:1.3.1'
     }



## Usage:
Import package,

import ‘package: aggrepay_flutter/aggrpay_flutter.dart’

Create hash for payment

Create a method for Generating hash.
Write a variable with Map<String, dynamic> type to create a hash.
Then create a List with String type and add all key names as string.
Sort that list with inbuilt sort(); method.
Create a For Loop for adding a vertical pipeline for each data.
Add Crypto package for creating hash.
Then create a hash with SHA512 algorithm.
Convert the hash to uppercase with .toUpperCase(); inbuilt method.

Example : 

    void createHash(String amount, String order) {
         var params = {
         'api_key': api_key,
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



## Create method for Aggrepay

Create an async method for communicating with aggrepay sdk which will return a payment response. 
Then create an instance for Aggrepay with the static method “pay” which accepts map type payment details.
Example,

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


    void open(Map<String, dynamic> params) async {
       try {
         var response = await AggrepayFlutter.pay(params);
         log(response.toString());
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
       } on PlatformException {
         address_line_1;
       }
     }


In the above example response variable returns a payment response as Json object with respective message and payment_response.






