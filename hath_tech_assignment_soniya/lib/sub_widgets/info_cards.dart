import 'package:flutter/material.dart';
import 'package:heth_tech_assignment_soniya/constants/ui_constants.dart';

class InfoCards extends StatelessWidget {
  InfoCards({this.color, this.imageUrl, this.onTap, this.text, this.balance});
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
        shadowColor: Colors.grey,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5),
          borderRadius: BorderRadius.circular(30.0),
        ),
// -------------------------------------------------------------------------------------------------

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              '$text : \$$balance',
              style: kTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
