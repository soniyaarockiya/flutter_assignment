import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/info_cards.dart';
import 'package:heth_tech_assignment_soniya/sub_widgets/repeated_row.dart';
import 'package:provider/provider.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';
import 'package:heth_tech_assignment_soniya/services/get_featured.dart';

class AvailableCryptoScreen extends StatefulWidget {
  //Screen id
  static const id = 'available_crypto_screen';

  @override
  _AvailableCryptoScreenState createState() => _AvailableCryptoScreenState();
}

class _AvailableCryptoScreenState extends State<AvailableCryptoScreen> {
  // Get Featured data --- api mock call for json response
  FeaturedData _featuredData = new FeaturedData();

  @override
  void initState() {
    super.initState();
    getFeatured(context);
  }

  void getFeatured(BuildContext context) async {
    await _featuredData.getFeaturedData(context);
  }

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
              // Stack(
              //   alignment: Alignment.bottomRight,
              //   children: <Widget>[
              //     TextField(
              //       textAlign: TextAlign.center,
              //       decoration: InputDecoration(
              //         hintText: 'Coin Name Or Symbol',
              //       ),
              //     ),
              //     IconButton(
              //         icon: Icon(
              //           Icons.search,
              //           color: kIconColor,
              //         ),
              //         onPressed: null),
              //   ],
              // ),
              // -------------------------------------------------------------------------------------------------

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InfoCards(
                    balance:
                        '${Provider.of<ProviderData>(context).cryptoBalance}',
                    text: 'Crypto',
                    color: Colors.black,
                    imageUrl:
                        Provider.of<ProviderData>(context).infoCardImageUrl2,
                  ),
                ),
              ),

              // -------------------------------------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: kSizedBox,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Featured',
                  textAlign: TextAlign.center,
                  style: kDividerTextStyle,
                ),
              ),
              // see sub_widgets folder for this widget
              RepeatedRow(),

              // -------------------------------------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: kSizedBox,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Portfolio',
                  textAlign: TextAlign.center,
                  style: kDividerTextStyle,
                ),
              ),
              // see sub_widgets folder for this widget
              RepeatedRow(),
            ],
          ),
        ),
      ),
    );
  }
}
