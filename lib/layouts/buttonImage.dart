import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            child: Image.asset(
              'images/facebook.png',
            ),
            backgroundColor: Color(0xFF5D74E2),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            child: Image.asset(
              'images/twitter.png',
            ),
            backgroundColor: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            child: Image.asset(
              'images/google.png',
            ),
            backgroundColor: Colors.white,
          ),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: () {},
          child: Image.asset(
            'images/linkedin.png',
          ),
          backgroundColor: Color(0xFF5D74E2),
        ),
      ],
    );
  }
}
