import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    final user = Provider.of<CustomUser>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
