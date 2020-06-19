import 'package:flutter/material.dart';

class InfoCards extends StatelessWidget {
  InfoCards({this.position, this.color});
  final double position;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position,
      bottom: 20.0,
      left: 0.0,
      right: 0.0,
      child: Card(
        elevation: 8,
        color: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Some text",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.amber,
              ),
            ),
          
          ),
        ),
      ),
    );
  }
}
