import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Home(),
      title: Text(
        'Cats and Dogs',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white.withOpacity(.7)
        ),
      ),
      image: Image.asset('assets/cat_dog_icon.png'),
      backgroundColor: Color(0xFF7D9E9E),
      photoSize: 60,
      loaderColor: Color(0xFF004242),
    );
  }
}
