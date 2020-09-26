import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import "package:splashscreen/splashscreen.dart";

void main() {
  runApp(MyApp());
}

/*
There is 3 Splash Screen classes:
    1. Splash()
    2. AnimatedSplashScreen()
    3. ColorLoader()
 */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorLoader(),
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







//Animation Loader Spash Screen
class ColorLoader extends StatefulWidget {

  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  ColorLoader({
    this.dotOneColor = Colors.white,
    this.dotTwoColor = Colors.white,
    this.dotThreeColor = Colors.white,
    this.duration = const Duration(milliseconds: 1000),
    this.dotType = DotType.circle,
    this.dotIcon = const Icon(Icons.blur_on)
  });

  @override
  _ColorLoader5State createState() => _ColorLoader5State();
}
enum DotType {
  square, circle, diamond, icon
}
class _ColorLoader5State extends State<ColorLoader>
    with SingleTickerProviderStateMixin {
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {
        //print(animation_1.value);
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    //print(animation_1.value <= 0.4 ? 2.5 * animation_1.value : (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value));
    return Container(
      color: Color.fromRGBO(137, 168, 73, 1),
      child: Column(

        children: [

          new Container(
              width: 450.0,
              height: 430.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('images/logo_circle_big.png')
                  )
              )),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Opacity(
              opacity: (animation_1.value <= 0.4 ? 2.5 * animation_1.value :
              (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value)),
                child: new Padding(
                padding: const EdgeInsets.only(right: 8.0),
                  child: Dot(
                  radius: 10.0,
                  color: widget.dotOneColor,
                  type: widget.dotType,
                    icon: widget.dotIcon,
                    ),
                ),
                ),
            Opacity(
              opacity: (animation_2.value <= 0.4 ? 2.5 * animation_2.value :
              (animation_2.value > 0.40 && animation_2.value <= 0.60)? 1.0 : 2.5 - (2.5 * animation_2.value)),
                child: new Padding(
                padding: const EdgeInsets.only(right: 8.0),
                  child: Dot(
                  radius: 10.0,
                  color: widget.dotTwoColor,
                  type: widget.dotType,
                    icon: widget.dotIcon,
                    ),
                    ),
                    ),
              Opacity(
                opacity: (animation_3.value <= 0.4 ? 2.5 * animation_3.value :
                (animation_3.value > 0.40 && animation_3.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_3.value)),
                  child: new Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                    child: Dot(
                    radius: 10.0,
                    color: widget.dotThreeColor,
                    type: widget.dotType,
                      icon: widget.dotIcon,
                      ),
                      ),
                      ),
                            ],
                        ),

                  ],
          )
    );
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }
}
class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final DotType type;
  final Icon icon;

  Dot({this.radius, this.color, this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: type == DotType.icon ?
      Icon(icon.icon, color: color, size: 1.3 * radius,)
          : new Transform.rotate(
        angle: type == DotType.diamond ? pi/4 : 0.0,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(color: color, shape: type == DotType.circle? BoxShape.circle : BoxShape.rectangle),
        ),
      ),
    );
  }
}

//Animation Splash Screen
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


//Metarial Design Splash Screen
class Splash extends StatelessWidget {
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
