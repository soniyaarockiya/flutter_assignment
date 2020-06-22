import 'package:flutter/material.dart';
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
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 8,
        color: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Image.network(imageUrl,
                fit: BoxFit.fitHeight,
                color: Color.fromRGBO(255, 255, 255, 0.3),
                colorBlendMode: BlendMode.modulate),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text : $balance',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
