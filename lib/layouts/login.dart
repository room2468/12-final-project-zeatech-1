import 'package:flutter/material.dart';
import 'package:zeatech/helpers/register.dart';
// import 'package:zeatech/helpers/sign_in.dart';
import 'package:zeatech/layouts/buttonImage.dart';
// import 'package:zeatech/layouts/firstscreen.dart';
import 'package:zeatech/layouts/formLogin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? SingleChildScrollView(child: ContentArea())
          : ContentArea(),
    );
  }
}

class ContentArea extends StatelessWidget {
  const ContentArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FormLogin(),
        Flexible(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      onChanged: (_) {},
                      value: false,
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text("Don't have an account? Register "),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Social Login",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(),
                ButtonImage()
              ],
            ),
          ),
        )
      ],
    );
  }
}
