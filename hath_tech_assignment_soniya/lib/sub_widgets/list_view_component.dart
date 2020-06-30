import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/rounded_button.dart';
import 'dart:math';

class ListComponent extends StatelessWidget {
  ListComponent(
      {this.paymentHistory, this.icon, this.toPayIconColor, this.minusPlus});
  final PaymentHistory paymentHistory;
  IconData icon;
  Color toPayIconColor;
  String minusPlus;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: toPayIconColor,
                size: 36.0,
              ),
            ),
          ),
          // -------------------------------------------------------------------------------------------------

          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  paymentHistory.name.toString(),
                  style: kListViewTitleText,
                ),
                Text(
                  paymentHistory.comment.toString(),
                  style: kListViewDescText,
                ),
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
                title:
                    '${minusPlus.toString()} \$${paymentHistory.amount.toString()}',
                // color: Colors.blueGrey,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
