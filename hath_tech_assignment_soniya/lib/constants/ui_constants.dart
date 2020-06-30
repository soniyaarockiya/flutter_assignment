import 'package:flutter/material.dart';

const kIconColor = Colors.deepPurple;

const kTitleTextStyle = TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold);
const kHeaderTextStyle =
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal);

const kTextStyle =
    TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, color: Colors.white);

const kMoneyStyle = TextStyle(
    fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.deepPurple);

const kSizedBox = SizedBox(height: 10.0, child: Divider(color: Colors.grey));

const kDividerTextStyle = TextStyle(
    fontSize: 23.0,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic);

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.purple, Colors.pink, Colors.red, Colors.blue],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
