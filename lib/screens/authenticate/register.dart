import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/shared/loading.dart';
import 'package:flutter_firebase/utils/validators.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text Fields
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            TextFormField(
              validator: (value) => Validations.isEmail(value),
              onChanged: (value) {
                setState(() => email = value);
              },
              decoration: textInputDecoration.copyWith(hintText: "Enter email"),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              validator: (value) =>
                  value.length < 6 ? 'Enter a password 6+ char long' : null,
              onChanged: (value) {
                setState(() => password = value);
              },
              decoration:
                  textInputDecoration.copyWith(hintText: "Enter password"),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 60,
              width: 200,
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print("$email $password");
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null)
                      setState(() {
                        error = "Error occured while registeration";
                        loading = false;
                      });
                  }
                },
                child: loading ? Loading() : Text("Register"),
              ),
            ),
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                error,
                style: TextStyle(fontSize: 15.0, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
