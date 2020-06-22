import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';

class RepeatedRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.attach_money,
            color: Colors.white,
          ),
        ),
        // -------------------------------------------------------------------------------------------------

        Text(
          Provider.of<ProviderData>(context).featuredCurrency,
        ),
        Text(
          Provider.of<ProviderData>(context).featuredCurrencyAmount,
          style: kMoneyStyle,
        ),
      ],
    );
  }
}
