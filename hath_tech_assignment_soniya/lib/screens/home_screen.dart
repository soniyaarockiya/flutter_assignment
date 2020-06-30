import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/rounded_button.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/info_cards.dart';
import 'package:heth_tech_assignment_soniya/screens/available_crypto.dart';
import 'package:provider/provider.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';

class HomeScreen extends StatefulWidget {
  // screen id
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Text(
                'Hey ${Provider.of<ProviderData>(context).userName}, your total balance is ',
                style: kHeaderTextStyle,
              ),
            ),
            // -------------------------------------------------------------------------------------------------

            Text(
              '\$${Provider.of<ProviderData>(context).totalBalance}',
              style: kMoneyStyle,
            ),

            // -------------------------------------------------------------------------------------------------
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
                    // see sub_widget folder for this widget
                    child: InfoCards(
                      balance:
                          '${Provider.of<ProviderData>(context).cryptoBalance}',
                      text: 'Crypto',
                      color: Colors.white,
                      imageUrl:
                          Provider.of<ProviderData>(context).infoCardImageUrl2,
                      onTap: () {
                        Navigator.pushNamed(context, AvailableCryptoScreen.id);
                      },
                    ),
                  ),
                  // -------------------------------------------------------------------------------------------------

                  Positioned(
                    top: 85.0,
                    bottom: 20.0,
                    left: 0.0,
                    right: 0.0,
                    // see sub_widget folder for this widget
                    child: InfoCards(
                      color: Colors.white,
                      balance:
                          '${Provider.of<ProviderData>(context).cashBalance}',
                      text: 'Cash',
                      imageUrl:
                          Provider.of<ProviderData>(context).infoCardImageUrl,
                    ),
                  )
                ],
              ),
            ),

            // -------------------------------------------------------------------------------------------------

            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedButton(
                      title: 'Request',
                      color: Colors.deepPurple,
                      onPressed: () {
                        // write code to request money
                      },
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: RoundedButton(
                      title: 'Send',
                      color: Colors.black,
                      onPressed: () {
                        //write code to send money
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
