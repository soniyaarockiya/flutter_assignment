import 'package:flutter/material.dart';

const kIconColor = Colors.deepPurple;

const kTitleTextStyle = TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold);
const kHeaderTextStyle =
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal);

const kTextStyle =
    TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, color: Colors.white);

const kMoneyStyle = TextStyle(
    fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.deepPurple);

const kListViewTitleText = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.6);

const kListViewDescText =
    TextStyle(color: Colors.black, fontSize: 14.0, letterSpacing: 1.6);

const kSizedBox = SizedBox(height: 10.0, child: Divider(color: Colors.white));

const kDividerTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.6);
const kInfoCardTextStyle =
    TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.purple, Colors.pink, Colors.red, Colors.blue],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
