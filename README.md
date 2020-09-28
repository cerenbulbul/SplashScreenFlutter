# <img src="https://user-images.githubusercontent.com/36292743/94367643-e3169580-0094-11eb-9b9e-2f91d53bf971.png" width="50" height="50"> Splash Screen

**How it runs?** 
- Clone the URL in your Android Studio
- Write Splash1() in the child(home) of myApp class and run
- Write Splash2() in the child(home) of myApp class and run 
- Write Splash3() in the child(home) of myApp class and run
- Write Splash4() in the child(home) of myApp class and run

&nbsp;
&nbsp;
&nbsp;

  1. [ Splash Screen 1 ](#s1)
      * [ Implementation](#imp1)
      * [ Demo](#Demo1)
  2. [ Splash Screen 2](#s2)
      * [ Implementation](#imp2)
      * [ Demo](#Demo2)
  3. [ Splash Screen 3](#s3)
      * [ Implementation](#imp3)
      * [ Demo](#Demo3)
  4. [ Splash Screen 4](#s4)
      * [ Implementation](#imp4)
      * [ Demo](#Demo4)
  

&nbsp;
&nbsp;
&nbsp;

<a name="s1"></a>
## Splash Screen 1 - Loading & Logo

There are a logo and a loading circle in the Splash Screen 1. I decided background color green bacuse Fible logo's colors are green and white. (logo's green and background green the same)

<a name="imp1"></a>
### How to Implement

```
class Splash1 extends StatelessWidget {
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

```

<a name="Demo1"></a>
### Demo 

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94367855-ef4f2280-0095-11eb-82f1-d51ae031aa6f.gif" alt="animated" />
</p>


&nbsp;
&nbsp;
&nbsp;

<a name="s2"></a>
## Splash Screen 2 - Animation Logo

There is a logo Splash Screen 2. The logo has an animation. I decided background color green bacuse Fible logo's colors are green and white. (logo's green and background green the same) 

<a name="imp2"></a>
### How to Implement

```

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

```

<a name="Demo2"></a>
### Demo 

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94400410-f0c42d80-011d-11eb-8034-d3e227e03e65.gif" alt="animated" />
</p>


&nbsp;
&nbsp;
&nbsp;

<a name="s3"></a>
## Splash Screen 3 - Loading & Logo

There are a logo and a loading circles as a line in the Splash Screen 3. I decided background color green bacuse Fible logo's colors are green and white. (logo's green and background green the same) 

<a name="imp3"></a>
### How to Implement


```
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

```

```

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

```

<a name="Demo3"></a>
### Demo 

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94368052-0e01e900-0097-11eb-935e-3caf2d2724d7.gif" alt="animated" />
</p>

&nbsp;
&nbsp;
&nbsp;

<a name="s4"></a>
## Splash Screen 4  Loading Animation & Logo

There are a logo and a loading animation in the Splash Screen 4. I decided background color green bacuse Fible logo's colors are green and white. (logo's green and background green the same)

<a name="imp4"></a>
## How to Implement?

```
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
```

```
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

```

<a name="Demo4"></a>
## Demo 

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94373431-567ece00-00ba-11eb-926b-adefa7d90e57.gif" alt="animated" />
</p>

&nbsp;
&nbsp;
&nbsp;

### Animation Examples ###

Animation Style (Logo and Loading) can changeable in the Splash Screen.
I utilized a documentation when I studying -> [Animation Class](https://api.flutter.dev/flutter/animation/Animation-class.html) </br>
Animation Examples: 

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94372377-c177d700-00b1-11eb-92c7-f9b782717aca.gif" alt="animated" />  <img src="https://user-images.githubusercontent.com/36292743/94373491-bb3a2880-00ba-11eb-9584-5523ce1be9ec.gif" alt="animated" />    <img src="https://user-images.githubusercontent.com/36292743/94373548-e1f85f00-00ba-11eb-8d1b-846af2a328e8.gif" alt="animated" /> <img src="https://user-images.githubusercontent.com/36292743/94373680-d48fa480-00bb-11eb-966b-9abf2e23e065.gif" alt="animated" /> 
</p>


&nbsp;
&nbsp;
&nbsp;
