import 'package:flutter/material.dart';

class RepeatedRow extends StatelessWidget {
  //todo: Create contructore here
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(),
        Column(
          children: <Widget>[
            Text('Metal'),
            Text('MTL'),
          ],
        ),
        Column(
          children: <Widget>[
            Text('dollars'),
            Text('dollars'),
          ],
        ),
      ],
    );
  }
}
