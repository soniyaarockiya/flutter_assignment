import 'package:flutter/cupertino.dart';

class ProviderData extends ChangeNotifier {
  String userName = "Soniya";
  String cashBalance = "0";
  String cryptoBalance = "0";
  String totalBalance = "0";
  String featuredCurrency = "Currency";
  String featuredCurrencyAmount = "0";
  String imageUrl =
      "https://images.pexels.com/photos/4099305/pexels-photo-4099305.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String infoCardImageUrl2 =
      'https://img.etimg.com/thumb/msid-75913693,width-300,imgsize-981580,resizemode-4/thinkstockphotos-876844728.jpg';
  String infoCardImageUrl =
      'https://c4.wallpaperflare.com/wallpaper/403/467/730/technology-bitcoin-coin-money-wallpaper-preview.jpg';

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

  void changeFeatured(String currencyName, String currencyAmount) {
    this.featuredCurrency = currencyName;
    this.featuredCurrencyAmount = currencyAmount;
  }
}
