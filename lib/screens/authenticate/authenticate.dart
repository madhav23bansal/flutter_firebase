import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authenticate/register.dart';
import 'package:flutter_firebase/screens/authenticate/sign_in.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/loading.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Flutter Firebase"),
            actions: [
              loading
                  ? Container(
                      child: Loading(
                        color: true,
                      ),
                    )
                  : IconButton(
                      tooltip: "Sign in anonymously",
                      icon: Icon(Icons.person),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInAnonmously();
                        if (result == null) {
                          print("NOT WORKING");
                          setState(() {
                            loading = false;
                          });
                        }
                      })
            ],
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text("Sign In",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text("Register",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SignIn(),
              Register(),
            ],
          )),
    );
  }
}
