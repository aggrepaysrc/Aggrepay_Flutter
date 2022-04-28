import 'dart:convert';

import 'dart:developer';

class PaymentResponse {
  String? status;
  PaymentResponse1? paymentResponse;

  PaymentResponse({this.status, this.paymentResponse});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    log(status.toString());
    paymentResponse = PaymentResponse1.fromJson(json["payment_response"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    if (paymentResponse != null) {
      data["payment_response"] = paymentResponse?.toJson();
    }
    return data;
  }
}

class PaymentResponse1 {
  String? orderId;
  String? amount;
  String? currency;
  String? description;
  String? name;
  String? email;
  String? phone;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? udf1;
  String? udf2;
  String? udf3;
  String? udf4;
  String? udf5;
  String? transactionId;
  String? paymentMode;
  String? paymentChannel;
  String? paymentDatetime;
  int? responseCode;
  String? responseMessage;
  String? errorDesc;
  String? cardmasked;
  String? hash;

  PaymentResponse1(
      {this.orderId,
      this.amount,
      this.currency,
      this.description,
      this.name,
      this.email,
      this.phone,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.country,
      this.zipCode,
      this.udf1,
      this.udf2,
      this.udf3,
      this.udf4,
      this.udf5,
      this.transactionId,
      this.paymentMode,
      this.paymentChannel,
      this.paymentDatetime,
      this.responseCode,
      this.responseMessage,
      this.errorDesc,
      this.cardmasked,
      this.hash});

  PaymentResponse1.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    amount = json["amount"];
    currency = json["currency"];
    description = json["description"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    addressLine1 = json["address_line_1"];
    addressLine2 = json["address_line_2"];
    city = json["city"];
    state = json["state"];
    country = json["country"];
    zipCode = json["zip_code"];
    udf1 = json["udf1"];
    udf2 = json["udf2"];
    udf3 = json["udf3"];
    udf4 = json["udf4"];
    udf5 = json["udf5"];
    transactionId = json["transaction_id"];
    paymentMode = json["payment_mode"];
    paymentChannel = json["payment_channel"];
    paymentDatetime = json["payment_datetime"];
    responseCode = json["response_code"];
    responseMessage = json["response_message"];
    errorDesc = json["error_desc"];
    cardmasked = json["cardmasked"];
    hash = json["hash"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["order_id"] = orderId;
    data["amount"] = amount;
    data["currency"] = currency;
    data["description"] = description;
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["address_line_1"] = addressLine1;
    data["address_line_2"] = addressLine2;
    data["city"] = city;
    data["state"] = state;
    data["country"] = country;
    data["zip_code"] = zipCode;
    data["udf1"] = udf1;
    data["udf2"] = udf2;
    data["udf3"] = udf3;
    data["udf4"] = udf4;
    data["udf5"] = udf5;
    data["transaction_id"] = transactionId;
    data["payment_mode"] = paymentMode;
    data["payment_channel"] = paymentChannel;
    data["payment_datetime"] = paymentDatetime;
    data["response_code"] = responseCode;
    data["response_message"] = responseMessage;
    data["error_desc"] = errorDesc;
    data["cardmasked"] = cardmasked;
    data["hash"] = hash;
    return data;
  }
}
