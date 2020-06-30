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
          backgroundImage:
              NetworkImage(Provider.of<ProviderData>(context).imageUrl),
          backgroundColor: Colors.black,
        ),
        // -------------------------------------------------------------------------------------------------

        Text(
          Provider.of<ProviderData>(context).featuredCurrency,
          // style: kListViewTitleText,
        ),
        Text(
          '\$ ${Provider.of<ProviderData>(context).featuredCurrencyAmount}',
          style: kMoneyStyle,
        ),
      ],
    );
  }
}
