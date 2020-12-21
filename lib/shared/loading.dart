import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loading extends StatelessWidget {
  bool color;
  Loading({Key key, this.color = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(color);
    return Center(
      child: color
          ? CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : CircularProgressIndicator(),
    );
  }
}
