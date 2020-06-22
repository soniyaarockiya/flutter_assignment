import 'package:flutter/cupertino.dart';
import 'package:heth_tech_assignment_soniya/services/network_api.dart';
import 'package:heth_tech_assignment_soniya/data/payment_history.dart';
import 'package:heth_tech_assignment_soniya/services/provider_service.dart';
import 'package:provider/provider.dart';

class FeaturedData {
  //here responde data that is received is manipulated , main api call happens in networkcall
  NetworkCall _networkCall = new NetworkCall();

  String url = "https://run.mocky.io/v3/e6d8c591-7ab9-4799-867c-55a31da6d47d";

  Future<void> getFeaturedData(BuildContext context) async {
    dynamic response = await _networkCall.getResponse(url);

    String name = response['currency'].toString();
    String amount = response['amount'].toString();

    Provider.of<ProviderData>(context, listen: false)
        .changeFeatured(name, amount);
    print(name);
    print(amount);
  }
}
