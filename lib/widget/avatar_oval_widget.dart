// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:elangsung_test_mobile/widget/avatar_show_widget.dart';
import 'package:flutter/material.dart';

class AvatarOval extends StatefulWidget {
  final String imageUrl;
  const AvatarOval({Key key, this.imageUrl}) : super(key: key);

  @override
  State<AvatarOval> createState() => _AvatarOvalState();
}

class _AvatarOvalState extends State<AvatarOval> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AvatarShow(
              imageUrl: widget.imageUrl,
            );
          },
        );
      },
      child: Container(
        height: 85,
        width: 85,
        child: Column(
          children: [
            ClipOval(
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
          ],
        ),
      ),
    );
  }
}