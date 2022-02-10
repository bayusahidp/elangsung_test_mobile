// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonHalfWidget extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color colorback;

  const ButtonHalfWidget({
    Key key,
    this.text,
    this.press, this.colorback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 43,
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FlatButton(
          padding: const EdgeInsets.all(8.0),
          color: colorback,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          onPressed: press,
        ),
      ),
    );
  }
}