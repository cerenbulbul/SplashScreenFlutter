import 'dart:async';
import 'package:flutter/material.dart';
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
      home: Splash(),
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