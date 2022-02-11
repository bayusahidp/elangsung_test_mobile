// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:elangsung_test_mobile/shared/constanta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  final GlobalKey<RefreshIndicatorState> keyRefresh;
  final Widget child;
  final Future Function() onRefresh;

  const RefreshWidget({
    Key key,
    this.keyRefresh,
    @required this.onRefresh,
    @required this.child,
  }) : super(key: key);

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) =>
      Platform.isAndroid ? buildAndroidList() : buildAndroidList();

  Widget buildAndroidList() => RefreshIndicator(
        key: widget.keyRefresh,
        onRefresh: widget.onRefresh,
        child: widget.child,
        color: cPrimaryOrange,
      );

  Widget buildIOSList() => CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: widget.onRefresh),
          SliverToBoxAdapter(child: widget.child),
        ],
      );
}