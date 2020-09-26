import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:splashscreen/splashscreen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Camper Boys")),
      body: Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 6);
    return SecondScreen();
  }


  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(137, 168, 73, 1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[


            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/logo_circle_big.png',
                width: animation.value * 600,
                height: animation.value * 600,
              ),
            ],
          ),
          new Align(alignment: Alignment.bottomCenter,
            child: new Text("Camper Campus",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),)
        ],
      ),
    );
  }
}






//Splash Screen 1
/*class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new SecondScreen(),
      image: new Image.asset("images/logo_circle.png"),
      photoSize: 200.0,
      loadingText: Text("Loading", style: TextStyle(
        color: Colors.white
      ),),
      loaderColor: Colors.white,
      backgroundColor: Color.fromRGBO(137, 168, 73, 1),
    );
  }
}
 */