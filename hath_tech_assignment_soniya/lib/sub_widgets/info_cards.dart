import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';
// import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';

class InfoCards extends StatelessWidget {
  InfoCards({this.color, this.imageUrl, this.onTap, this.text, this.balance});
  // final double position;
  final Color color;
  final String imageUrl;
  final Function onTap;
  final String text;
  final String balance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.blueGrey,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3.5, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Image.network(imageUrl,
                fit: BoxFit.fill,
                color: Color.fromRGBO(255, 255, 255, 0.3),
                colorBlendMode: BlendMode.modulate),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                '$text : \$$balance',
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
