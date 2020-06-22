import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';

class ListComponent extends StatelessWidget {
  ListComponent({this.paymentHistory});
  final PaymentHistory paymentHistory;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
          Column(
            children: <Widget>[
              Text(paymentHistory.name.toString()),
              Text(paymentHistory.comment.toString()),
            ],
          ),
          Text(paymentHistory.amount.toString()),
        ],
      ),
    );
  }
}
