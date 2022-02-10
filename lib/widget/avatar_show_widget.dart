// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AvatarShow extends StatefulWidget {
  final String imageUrl;
  const AvatarShow({Key key, this.imageUrl}) : super(key: key);

  @override
  _AvatarShowState createState() => _AvatarShowState();
}

class _AvatarShowState extends State<AvatarShow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: size.width * 0.7,
        child: ClipPath(
          child: Image.network(
            widget.imageUrl,
            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return Image.asset(
                "assets/images/default-profile.png",
                fit: BoxFit.cover,
              );
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}