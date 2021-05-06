import 'package:Corona_Tracker/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';



class SmashVirus extends StatefulWidget {
  @override
  _SmashVirusState createState() => _SmashVirusState();
}

class _SmashVirusState extends State<SmashVirus>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        value: 0.0,
        duration: Duration(seconds: 25),
        upperBound: 1,
        lowerBound: -1,
        vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(360, 740), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                      height: ScreenUtil().setHeight(350),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xff5e60ce), Color(0xff5390d9)]))),
                  builder: (BuildContext context, Widget child) {
                    return ClipPath(
                      clipper: DrawClip(_controller.value),
                      child: child,
                    );
                  }),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                    horizontal: ScreenUtil().setWidth(20)),
                child: Text(
                  "Welcome to COVID-19 Tracker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(35),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Image.asset(
              "assets/images/mainvirus.png",
              height: ScreenUtil().setHeight(270),
              width: ScreenUtil().setWidth(270),
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff5390d9),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15),
                vertical: ScreenUtil().setHeight(7)),
            child: Text(
              "Smash that COVID-19 to proceed",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          )
        ],
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    // ignore: todo
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter = size.width * 0.5 +
        (size.width * 0.6 + ScreenUtil().setWidth(1)) * math.sin(move * slice);
    double yCenter =
        size.height * 0.8 + ScreenUtil().setHeight(69) * math.cos(move * slice);

    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // ignore: todo
    // TODO: implement shouldReclip
    return true;
  }
}
