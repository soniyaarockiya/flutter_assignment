import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/rounded_button.dart';

class ListComponent extends StatelessWidget {
  ListComponent({this.paymentHistory});
  final PaymentHistory paymentHistory;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // -------------------------------------------------------------------------------------------------

          Expanded(
            flex: 7,
            child: Column(
              children: <Widget>[
                Text(paymentHistory.name.toString()),
                Text(paymentHistory.comment.toString()),
              ],
            ),
          ),
          // -------------------------------------------------------------------------------------------------

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: RoundedButton(
                onPressed: () {},
                title: '\$${paymentHistory.amount.toString()}',
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
