
import 'package:flutter/material.dart';

class PaymentMenthodPage extends StatelessWidget {
  const PaymentMenthodPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 39,
          ),
          Text(
            'Wellcome to Payment Method',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 39,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Pay Now'))
        ],
      )),
    );
  }
}
