import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/rounded_button.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/info_cards.dart';
import 'package:heth_tech_assignment_soniya/screens/available_crypto.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

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
                Positioned(
                  top: 10.0,
                  bottom: 20.0,
                  left: 0.0,
                  right: 0.0,
                  child: InfoCards(
                    color: Colors.black,
                    imageUrl: 'https://wallpapercave.com/wp/wp2337006.jpg',
                    onTap: () {
                      Navigator.pushNamed(context, AvailableCryptoScreen.id);
                    },
                  ),
                ),
                Positioned(
                  top: 75.0,
                  bottom: 20.0,
                  left: 0.0,
                  right: 0.0,
                  child: InfoCards(
                    color: Colors.blueAccent,
                    imageUrl:
                        'https://i.pinimg.com/564x/85/c0/34/85c0345fb0d7bb63ab78127badb31f44.jpg',
                  ),
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
