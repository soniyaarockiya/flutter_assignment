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
      padding: const EdgeInsets.all(35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Expanded(
                child: Text(
                  'Hey $userName, your total balance is ',
                  style: kTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              '\$$totalBalance',
              style: kMoneyStyle,
            ),
          ),
          Expanded(
            flex: 7,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                InfoCards(
                  position: 10.0,
                  color: Colors.black,
                ),
                InfoCards(
                  position: 70.0,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
