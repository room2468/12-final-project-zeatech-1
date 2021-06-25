import 'package:flutter/material.dart';
import 'package:zeatech/authentication/firebaseAuth.dart';
import 'package:zeatech/layouts/home.dart';
import 'package:zeatech/layouts/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: isLoading == false
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2.4,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            image: DecorationImage(
                              image: AssetImage('images/header.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 3.6,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              margin: const EdgeInsets.all(20.0),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: _email,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.email,
                                          color: Colors.pink[200],
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.pinkAccent,
                                          ),
                                        ),
                                        labelText: "Email: ",
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: _password,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.security,
                                          color: Colors.pink[200],
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.pinkAccent,
                                          ),
                                        ),
                                        labelText: "Password: ",
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        AuthClass()
                                            .createAccount(
                                                email: _email.text.trim(),
                                                password: _password.text.trim())
                                            .then((value) {
                                          if (value == "Account created") {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login()),
                                                (route) => false);
                                          } else {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(value)));
                                          }
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
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
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: Text(
                                          "Already have an account? Login "),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
