import 'package:flutter/material.dart';
import 'package:zeatech/layouts/buttonImage.dart';
import 'package:zeatech/layouts/formLogin.dart';

class Login extends StatelessWidget {
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
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF13E3D2),
                      Color(0xFF5D74E2)
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(80.0),
                  ),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 150.0,
                    minHeight: 36.0,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
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
