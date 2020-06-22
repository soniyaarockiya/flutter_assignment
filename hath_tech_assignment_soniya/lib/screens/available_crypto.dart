import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/info_cards.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/repeated_row.dart';
import 'package:provider/provider.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';

class AvailableCryptoScreen extends StatefulWidget {
  static const id = 'available_crypto_screen';

  @override
  _AvailableCryptoScreenState createState() => _AvailableCryptoScreenState();
}

class _AvailableCryptoScreenState extends State<AvailableCryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MarketPlace',
        ),
      ),
      body: Container(
        // color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Coin Name Or Symbol',
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: kIconColor,
                      ),
                      onPressed: null),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InfoCards(
                  balance:
                      '${Provider.of<ProviderData>(context).cryptoBalance}',
                  text: 'Crypto',
                  color: Colors.black,
                  imageUrl: Provider.of<ProviderData>(context).infoCardImageUrl,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Text(
                'Featured',
                textAlign: TextAlign.center,
              ),
              RepeatedRow(),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              RepeatedRow(),
            ],
          ),
        ),
      ),
    );
  }
}
