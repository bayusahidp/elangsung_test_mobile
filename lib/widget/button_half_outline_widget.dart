// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, prefer_const_constructors

import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:flutter/material.dart';

class ButtonHalfOutlineWidget extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const ButtonHalfOutlineWidget({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 43,
      width: size.width * 0.5,
      child: ClipRRect(
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: cEigthGrey,
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