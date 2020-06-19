import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/rounded_button.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/info_cards.dart';

class HomeScreen extends StatelessWidget {
  final String userName = 'Soniya';
  final String totalBalance = '100';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Text(
              'Hey $userName, your total balance is ',
              style: kTextStyle,
            ),
          ),
          Text(
            '\$$totalBalance',
            style: kMoneyStyle,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                InfoCards(
                  position: 10.0,
                  color: Colors.black,
                ),
                InfoCards(
                  position: 80.0,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RoundedButton(
                  title: 'Request',
                  color: Colors.blueAccent,
                  onPressed: () {
                    // Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: RoundedButton(
                  title: 'Send',
                  color: Colors.black,
                  onPressed: () {
                    // Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
