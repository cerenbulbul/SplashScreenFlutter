import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import "package:splashscreen/splashscreen.dart";
import 'dart:core';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:task/animation.dart';

/*
There is 3 Splash Screen classes:
    1. Splash1()
    2. Splash2()
    3. Splash3()
    4. Splash4()
 */


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
      home: Splash4(),
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


class Splash4 extends StatefulWidget {
  Splash4({
    this.minRadius: 3.6,
    this.maxRadius: 7.2,
    this.minAlpha: 51,
    this.maxAlpha: 255,
    this.spacing: 3,
    this.ballColor: Colors.white,
    this.duration: const Duration(milliseconds: 400),
  });

  final double minRadius;
  final double maxRadius;
  final double minAlpha;
  final double maxAlpha;
  final double spacing;
  final Color ballColor;
  final Duration duration;

  @override
  State<StatefulWidget> createState() => _BallGridPulseIndicatorState();
}

class _BallGridPulseIndicatorState extends State<Splash4>
    with SingleTickerProviderStateMixin, InfiniteProgressMixin {
  @override
  void initState() {
    startEngine(this, widget.duration);
    super.initState();
  }

  @override
  void dispose() {
    closeEngine();
    super.dispose();
  }

  @override
  Size measureSize() {
    var size = widget.maxRadius * 2 * 3 + widget.spacing * 2;
    return Size(size, size);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(137, 168, 73, 1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/logo_circle_big.png'),
          AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(
                  size: measureSize(),
                  painter: _BallGridPulseIndicatorPainter(
                      animationValue: animationValue,
                      minRadius: widget.minRadius,
                      maxRadius: widget.maxRadius,
                      minAlpha: widget.minAlpha,
                      maxAlpha: widget.maxAlpha,
                      spacing: widget.spacing,
                      ballColor: widget.ballColor),
                );
              })
        ],
      )
    );

  }
}

double _progress = .0;
double _lastExtent = .0;

class _BallGridPulseIndicatorPainter extends CustomPainter {
  _BallGridPulseIndicatorPainter({
    this.animationValue,
    this.minRadius,
    this.maxRadius,
    this.minAlpha,
    this.maxAlpha,
    this.spacing,
    this.ballColor,
  })  : radiusList = <double>[
    minRadius + (maxRadius - minRadius) * 0.9,
    minRadius + (maxRadius - minRadius) * 0.8,
    minRadius + (maxRadius - minRadius) * 0.7,
    minRadius + (maxRadius - minRadius) * 0.6,
    minRadius + (maxRadius - minRadius) * 0.5,
    minRadius + (maxRadius - minRadius) * 0.4,
    minRadius + (maxRadius - minRadius) * 0.3,
    minRadius + (maxRadius - minRadius) * 0.2,
    minRadius + (maxRadius - minRadius) * 0.1,
  ],
        alphaList = <double>[
          minAlpha + (maxAlpha - minAlpha) * 0.9,
          minAlpha + (maxAlpha - minAlpha) * 0.8,
          minAlpha + (maxAlpha - minAlpha) * 0.7,
          minAlpha + (maxAlpha - minAlpha) * 0.6,
          minAlpha + (maxAlpha - minAlpha) * 0.5,
          minAlpha + (maxAlpha - minAlpha) * 0.4,
          minAlpha + (maxAlpha - minAlpha) * 0.3,
          minAlpha + (maxAlpha - minAlpha) * 0.2,
          minAlpha + (maxAlpha - minAlpha) * 0.1,
        ];
  final double animationValue;
  final double minRadius;
  final double maxRadius;
  final double minAlpha;
  final double maxAlpha;
  final double spacing;
  final Color ballColor;
  final List<double> radiusList;
  final List<double> alphaList;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = ballColor
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    _progress += (_lastExtent - animationValue).abs();
    _lastExtent = animationValue;
    if (_progress >= double.maxFinite) {
      _progress = .0;
      _lastExtent = .0;
    }

    var diffRadius = maxRadius - minRadius;
    var diffAlpha = maxAlpha - minAlpha;
    for (int i = 0; i < radiusList.length; i++) {
      canvas.save();
      int row = i ~/ 3;
      int column = i % 3;

      var dx = maxRadius + 2 * column * maxRadius + column * spacing;
      var dy = (2 * row + 1) * maxRadius + row * spacing;
      var offset = Offset(dx, dy);

      var offsetAlpha = asin((alphaList[i] - minAlpha) / diffAlpha);
      var beatAlpha =
          sin(_progress * pi / 180 + offsetAlpha).abs() * diffAlpha + minAlpha;
      paint.color = Color.fromARGB(
          beatAlpha.round(), ballColor.red, ballColor.green, ballColor.blue);

      var offsetExtent = asin((radiusList[i] - minRadius) / diffRadius);
      var scaleRadius =
          sin(_progress * pi / 180 + offsetExtent).abs() * diffRadius +
              minRadius;
      canvas.drawCircle(offset, scaleRadius, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}









//Animation Loader Spash Screen
class Splash3 extends StatefulWidget {

  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  Splash3({
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
class _ColorLoader5State extends State<Splash3>
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
class Splash2 extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}
class SplashScreenState extends State<Splash2>
    with SingleTickerProviderStateMixin {
  var _visible = false;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return SecondScreen();
  }
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.decelerate);

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
class Splash1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new SecondScreen(),
      image: new Image.asset("images/logo_circle_big.png"),
      photoSize: 200.0,
      loadingText: Text("Loading", style: TextStyle(
        color: Colors.white
      ),),
      loaderColor: Colors.white,
      backgroundColor: Color.fromRGBO(137, 168, 73, 1),
    );
  }
}


