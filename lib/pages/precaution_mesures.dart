import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Precaution extends StatelessWidget {
  var precaution = [
    "Clean your hands often. Use soap and water, or an alcohol-based hand rub.",
    'Maintain a safe distance from anyone who is coughing or sneezing.',
    'If you have a fever, cough and difficulty breathing, seek medical attention.',
    'Wear a mask when physical distancing is not possible.',
    'Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: ScreenUtil().setSp(35),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "PRECAUTION AND SAFETY MEASURES",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ScreenUtil().setSp(25)),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: SingleChildScrollView(
                  child: Column(
            children: [
              Row(
                children: [
                  Expanded(

                    child: Text("1. ${precaution[0]}",style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20),
                              color: Theme.of(context).brightness == Brightness.light
                    ?Colors.black:Colors.white))),
                  //     child: RichText(
                  //   text: TextSpan(children: <TextSpan>[
                  //     TextSpan(
                  //         text: "1. ",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: ScreenUtil().setSp(20),
                  //             color: Theme.of(context).brightness == Brightness.light
                  //   ?Colors.black:Colors.white)),
                  //     TextSpan(
                  //         text: precaution[0],
                  //         style: TextStyle(
                  //             // fontWeight: FontWeight.bold,
                  //             fontSize: ScreenUtil().setSp(20),
                  //             color: Theme.of(context).brightness == Brightness.light
                  //   ?Colors.black:Colors.white))
                  //   ]),
                  // )
                  
                  Container(
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: ScreenUtil().setWidth(5)),
                    child: Image.asset(
                      "assets/images/Precaution1.png",
                      height: ScreenUtil().setHeight(100),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
               SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Image.asset(
                      "assets/images/Precaution2.png",
                      height: ScreenUtil().setHeight(100),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Text("2. ${precaution[1]}",style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20),
                              color: Theme.of(context).brightness == Brightness.light
                    ?Colors.black:Colors.white))),
                ],
              ),
               SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
               SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
               Row(
                children: [
                  Expanded(
                       child: Text("3. ${precaution[2]}",style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20),
                              color: Theme.of(context).brightness == Brightness.light
                    ?Colors.black:Colors.white))),
                  
                  Container(
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: ScreenUtil().setWidth(5)),
                    child: Image.asset(
                      "assets/images/Precaution3.jpg",
                      height: ScreenUtil().setHeight(100),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
               SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Image.asset(
                      "assets/images/Precaution4.png",
                      height: ScreenUtil().setHeight(100),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                       child: Text("4. ${precaution[3]}",style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20),
                              color: Theme.of(context).brightness == Brightness.light
                    ?Colors.black:Colors.white))),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
               SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Row(
                children: [
                  Expanded(
                       child: Text("5. ${precaution[4]}",style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(20),
                              color: Theme.of(context).brightness == Brightness.light
                    ?Colors.black:Colors.white))),
                  Container(
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: ScreenUtil().setWidth(5)),
                    child: Image.asset(
                      "assets/images/Precaution5.jpg",
                      height: ScreenUtil().setHeight(100),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
               SizedBox(
                height: ScreenUtil().setHeight(75),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
