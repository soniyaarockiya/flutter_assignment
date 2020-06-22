import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';

class ScanScreen extends StatelessWidget {
  static const id = 'scan_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'SCAN BODY',
        style: kTitleTextStyle,
      )),
    );
  }
}
