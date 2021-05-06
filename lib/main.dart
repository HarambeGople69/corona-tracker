import 'dart:async';
import 'package:Corona_Tracker/smash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_admob/firebase_admob.dart';

// void main() => runApp(
//       DevicePreview(
//         // enabled: !kReleaseMode,
//         builder: (context) => MyApp(),
//       ),
//     );

// void main() {
//   runApp(
//     MyApp()
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
  runApp(
  //   DevicePreview(
  //       // enabled: !kReleaseMode,
  //       builder: (context) => MyApp(),
  //     ),

      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context,
    //     designSize: Size(360, 740), allowFontScaling: false);
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
          
          primaryColor: Color(0xff6088c4),
          brightness: brightness == Brightness.dark
              ? Brightness.dark
              : Brightness.light,
          scaffoldBackgroundColor: brightness == Brightness.dark
              ? Colors.blueGrey[900]
              : Colors.white,
          fontFamily: "Nunito",
        );
      },
      themedWidgetBuilder: (context, theme) {
        // ScreenUtil.init(context,
        //     designSize: Size(360, 740), allowFontScaling: false);
        return MaterialApp(
      //     locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: theme,
          title: "COVID-19 Tracker",
          home: SplashScreen(),
        );
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
//           builder: DevicePreview.appBuilder,
//       home: SplashScreen(),
//     );
//   }
// }

// MaterialApp(
//           debugShowCheckedModeBanner: false,
//           locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
//           builder: DevicePreview.appBuilder,
//           theme: ThemeData(
//              primaryColor: Color(0xff6088c4),
//           ),
//           home: SplashScreen(),
//         );

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
     ScreenUtil.init(context,
        designSize: Size(360, 740), allowFontScaling: false);
    return Scaffold(
      body: Center(
        child: Container(
          width: ScreenUtil().setHeight(550),
          height: ScreenUtil().setWidth(450),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/final.png"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }

  void completed() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SmashVirus()));
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => S()));
  }
}
