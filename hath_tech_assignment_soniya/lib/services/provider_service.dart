import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  //Logged In user id
  String userName = "Soniya";
  String cashBalance = "0";
  String cryptoBalance = "0";
  String totalBalance = "0";
  String myBitcoin = "0";
  String imageUrl =
      "https://images.pexels.com/photos/4099305/pexels-photo-4099305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  void changeUserName(newName) {
    this.userName = newName;
    notifyListeners();
  }

  void changeBalance(newCash) {
    this.cashBalance = newCash;
    print('$cashBalance................................');
    notifyListeners();
  }

  void changeCrypto(newCrypto) {
    this.cryptoBalance = newCrypto;
    notifyListeners();
  }

  void totalBal(String cashBal, String cryptoBal) {
    int number = int.parse(cashBal) + int.parse(cryptoBal);
    this.totalBalance = number.toString();
    notifyListeners();
  }
}
