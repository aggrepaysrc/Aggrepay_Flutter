import 'package:aggrepay_flutter_example/payment_response.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key, required this.paymentResponse})
      : super(key: key);
  final PaymentResponse paymentResponse;

  @override
  Widget build(BuildContext context) {
    var payment = paymentResponse.paymentResponse!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                  size: 36,
                ),
                const SizedBox(width: 10),
                Text(
                  payment.responseMessage.toString(),
                  textScaleFactor: 1.4,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            detail(
              title: 'Transaction ID',
              value: payment.transactionId.toString(),
            ),
            detail(title: 'Order ID', value: payment.orderId.toString()),
            detail(title: 'Amount', value: payment.amount.toString()),
            detail(title: 'Name', value: payment.name.toString()),
            detail(title: 'Phone', value: payment.phone.toString()),
            detail(title: 'Email', value: payment.email.toString()),
            detail(
              title: 'Payment Mode',
              value: payment.paymentMode.toString(),
            ),
            detail(
                title: 'Payment Channel',
                value: payment.paymentChannel.toString()),
            detail(title: 'Description', value: payment.description.toString()),
          ],
        ),
      ),
    );
  }

  Widget detail({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(':'),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
