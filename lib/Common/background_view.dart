import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  BackgroundView({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Container(
      child: Container(
      color: Color.fromRGBO(0, 0, 0, 0),
      child: child,
    ),
      width: deviceSize.width,
      height: deviceSize.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/bg_4.jpeg'),
        fit: BoxFit.cover,
      )),
    );
  }
}
