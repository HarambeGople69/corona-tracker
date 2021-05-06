import 'dart:convert';
import 'package:Corona_Tracker/pages/precaution_mesures.dart';
import 'package:Corona_Tracker/pages/symptoms.dart';
import 'package:Corona_Tracker/panels/leastaffectedpanal.dart';
import 'package:Corona_Tracker/panels/mostaffectedpanal.dart';
import 'package:Corona_Tracker/panels/worldwidepanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_admob/firebase_admob.dart';

// const String testDevice = '9026BAE5F8C7FF79283E7148D476423A';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //     // testDevices: testDevice != null ? <String>[testDevice] : null,
  //     // keywords: <String>['wallpapers', 'walls', 'amoled']
  //     );

  InterstitialAd _interstitialAd;
  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: "ca-app-pub-4624789056859901/5862023583",
      size: AdSize.fullBanner,
      // targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-4624789056859901/1362884687", //ca-app-pub-4624789056859901/1362884687
      // targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  Map worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v3/covid-19/all");
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get("https://corona.lmao.ninja/v3/covid-19/countries?sort=cases");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  List recoveredcountryData;
  fetchrecoveredCountryData() async {
    http.Response response = await http
        .get("https://corona.lmao.ninja/v3/covid-19/countries?sort=recovered");
    setState(() {
      recoveredcountryData = jsonDecode(response.body);
    });
  }

  Future fetchData() async {
    fetchCountryData();
    fetchWorldWideData();
    fetchrecoveredCountryData();
  }

  int number = 1;
  int range = 3;

  int asia = 0;
  int northAmerica = 0;
  int southAmerica = 0;
  int europe = 0;
  int africa = 0;
  int australia = 0;

  int asiaRecovered = 0;
  int northAmericaRecovered = 0;
  int southAmericaRecovered = 0;
  int europeRecovered = 0;
  int africaRecovered = 0;
  int australiaRecovered = 0;

  int asiaActive = 0;
  int northAmericaActive = 0;
  int southAmericaActive = 0;
  int europeActive = 0;
  int africaActive = 0;
  int australiaActive = 0;

  int asiaConfirmed = 0;
  int northAmericaConfirmed = 0;
  int southAmericaConfirmed = 0;
  int europeConfirmed = 0;
  int africaConfirmed = 0;
  int australiaConfirmed = 0;

  // ignore: non_constant_identifier_names
  String InputValue = "";
  int found = -9;

  // ignore: unused_field
  TextEditingController _controller = new TextEditingController();

  int ok = 0;

  void asiaDeath() {
    for (var i = 0; i < countryData.length; i++) {
      if (countryData[i]['continent'] == "Asia") {
        setState(() {
          asia = asia + countryData[i]['deaths'];
          asiaRecovered = asiaRecovered + countryData[i]['recovered'];
          asiaActive = asiaActive + countryData[i]['active'];
          asiaConfirmed = asiaConfirmed + countryData[i]['cases'];
        });
      }
    }
  }

  void europeDeath() {
    for (var i = 0; i < countryData.length; i++) {
      if (countryData[i]['continent'] == "Europe") {
        setState(() {
          europe = europe + countryData[i]['deaths'];
          europeRecovered = europeRecovered + countryData[i]['recovered'];
          europeActive = europeActive + countryData[i]['active'];
          europeConfirmed = europeConfirmed + countryData[i]['cases'];
        });
      }
    }
  }

  void africaDeath() {
    for (var i = 0; i < countryData.length; i++) {
      if (countryData[i]['continent'] == "Africa") {
        setState(() {
          africa = africa + countryData[i]['deaths'];
          africaRecovered = africaRecovered + countryData[i]['recovered'];
          africaActive = africaActive + countryData[i]['active'];
          africaConfirmed = africaConfirmed + countryData[i]['cases'];
        });
      }
    }
  }

  void australiaDeath() {
    for (var i = 0; i < countryData.length; i++) {
      if (countryData[i]['continent'] == "Australia/Oceania") {
        setState(() {
          australia = australia + countryData[i]['deaths'];
          australiaRecovered = australiaRecovered + countryData[i]['recovered'];
          australiaActive = australiaActive + countryData[i]['active'];
          australiaConfirmed = australiaConfirmed + countryData[i]['cases'];
        });
      }
    }
  }

// North America
  void northAmericaDeath() {
    for (var i = 0; i < countryData.length; i++) {
      if (countryData[i]['continent'] == "North America") {
        setState(() {
          northAmerica = northAmerica + countryData[i]['deaths'];
          northAmericaRecovered =
              northAmericaRecovered + countryData[i]['recovered'];
          northAmericaActive = northAmericaActive + countryData[i]['active'];
          northAmericaConfirmed =
              northAmericaConfirmed + countryData[i]['cases'];
        });
      }
    }
  }

  void southAmericaDeath() {
    for (var i = 0; i < countryData.length; i++) {
      if (countryData[i]['continent'] == "South America") {
        setState(() {
          southAmerica = southAmerica + countryData[i]['deaths'];
          southAmericaRecovered =
              southAmericaRecovered + countryData[i]['recovered'];
          southAmericaActive = southAmericaActive + countryData[i]['active'];
          southAmericaConfirmed =
              southAmericaConfirmed + countryData[i]['cases'];
        });
      }
    }
  }

  // ignore: non_constant_identifier_names
  void OnceOnly(int ok) {
    if (ok == 0) {
      setState(() {
        asiaDeath();
        europeDeath();
        africaDeath();
        australiaDeath();
        northAmericaDeath();
        southAmericaDeath();
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    fetchData();
    // asiaDeath();
    // europeDeath();
    // africaDeath();
    // australiaDeath();
    // northAmericaDeath();
    // southAmericaDeath();
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-4624789056859901~1427298012");
    _bannerAd = createBannerAd()
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 740), allowFontScaling: false);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Warning",
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
            content: Text(
              "Are you sure you want to exit?",
              style: TextStyle(fontSize: ScreenUtil().setSp(25)),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        color: Color(0xff6088c4)),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        color: Color(0xff6088c4)),
                  )),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(125)),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "COVID-19 TRACKER",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Theme.of(context).brightness == Brightness.light
                        ? Icons.lightbulb_outline
                        : Icons.highlight,
                    size: ScreenUtil().setSp(35),
                  ),
                  onPressed: () {
                    setState(() {
                      DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.light
                              ? Brightness.dark
                              : Brightness.light);
                    });
                  })
            ],
            bottom: PreferredSize(
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(5),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              InputValue = value;
                            });
                          },
                          style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(5),
                                horizontal: ScreenUtil().setHeight(10)),
                            labelText: "Enter country name",
                            labelStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(20)),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            size: ScreenUtil().setSp(35),
                          ),
                          onPressed: () {
                            _interstitialAd?.dispose();
                            _interstitialAd = createInterstitialAd()..load();
                            _interstitialAd?.show();
                            if (InputValue != "") {
                              for (var i = 0; i < countryData.length; i++) {
                                if (countryData[i]["country"]
                                        .toString()
                                        .toUpperCase() ==
                                    InputValue.toUpperCase()) {
                                  _DetailBottomSheet(context, i);

                                  break;
                                }
                              }
                            } else {
                              return null;
                            }
                          })
                    ],
                  )),
              preferredSize: Size.fromHeight(
                ScreenUtil().setHeight(10),
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: fetchData,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setHeight(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            range = 3;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(ScreenUtil().setSp(10)),
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          decoration: BoxDecoration(
                              border: (range == 3)
                                  ? Border.all(
                                      width: 2,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white)
                                  : null,
                              borderRadius: (range == 3)
                                  ? BorderRadius.circular(10)
                                  : null),
                          child: Text(
                            "Worldwide",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight:
                                    (range == 3) ? FontWeight.bold : null),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            range = 4;
                            if (countryData != null) {
                              OnceOnly(ok);
                              ok = 1;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(5),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          decoration: BoxDecoration(
                              border: (range == 4)
                                  ? Border.all(
                                      width: 2,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white)
                                  : null,
                              borderRadius: (range == 4)
                                  ? BorderRadius.circular(10)
                                  : null),
                          child: Text(
                            "Continential",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight:
                                    (range == 4) ? FontWeight.bold : null),
                          ),
                        ),
                      ),
                    ],
                  ),
                  (range == 3)
                      ? Column(
                          children: [
                            Center(
                              child: (worldData == null)
                                  ? Container()
                                  : PieChart(
                                      chartLegendSpacing: 32,
                                      animationDuration:
                                          Duration(milliseconds: 800),
                                      chartRadius:
                                          MediaQuery.of(context).size.width /
                                              1.2,
                                      legendOptions: LegendOptions(
                                          legendPosition: LegendPosition.right,
                                          legendTextStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ScreenUtil().setSp(15))),
                                      dataMap: {
                                        "Confirmed":
                                            worldData['cases'].toDouble(),
                                        "Active":
                                            worldData['active'].toDouble(),
                                        "Recovered":
                                            worldData['recovered'].toDouble(),
                                        "Deaths":
                                            worldData['deaths'].toDouble(),
                                      },
                                      chartValuesOptions: ChartValuesOptions(
                                        chartValueStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        showChartValueBackground: true,
                                        showChartValues: true,
                                        showChartValuesInPercentage: true,
                                        showChartValuesOutside: false,
                                      ),
                                      colorList: [
                                        Colors.red[200],
                                        Colors.blue[200],
                                        Colors.green[200],
                                        Colors.grey[600]
                                      ],
                                    ),
                            ),
                            (worldData == null)
                                ? CircularProgressIndicator()
                                : WorldWidePanel(
                                    WorldData: worldData,
                                  ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Precaution();
                                }));
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/precaution.png",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Precaution and safety measures",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6088c4),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        number = 1;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(10),
                                        vertical: ScreenUtil().setHeight(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(10),
                                        vertical: ScreenUtil().setHeight(5),
                                      ),
                                      decoration: BoxDecoration(
                                          border: (number == 1)
                                              ? Border.all(
                                                  width: 2,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white)
                                              : null,
                                          borderRadius: (number == 1)
                                              ? BorderRadius.circular(10)
                                              : null),
                                      child: Text(
                                        "Countries with most deaths",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            fontWeight: (number == 1)
                                                ? FontWeight.bold
                                                : null),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        number = 2;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(10),
                                        vertical: ScreenUtil().setHeight(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(10),
                                        vertical: ScreenUtil().setHeight(5),
                                      ),
                                      decoration: BoxDecoration(
                                          border: (number == 2)
                                              ? Border.all(
                                                  width: 2,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white)
                                              : null,
                                          borderRadius: (number == 2)
                                              ? BorderRadius.circular(10)
                                              : null),
                                      child: Text(
                                        "Countries with most recoveries",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            fontWeight: (number == 2)
                                                ? FontWeight.bold
                                                : null),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            (number == 1)
                                ? countryData == null
                                    ? Container()
                                    : MostAffectedPanal(
                                        countryData: countryData,
                                      )
                                : Container(),
                            (number == 2)
                                ? recoveredcountryData == null
                                    ? Container()
                                    : LeastAffectedPanal(
                                        countryData: recoveredcountryData,
                                      )
                                : Container(),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Symptoms();
                                }));
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/symptoms.jpg",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Symptoms of COVID-19",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6088c4),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  (range == 4 && countryData != null)
                      ? Column(
                          children: [
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/asia.png",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Asia",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff6088c4),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: $asia",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Recovered: $asiaRecovered",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              children: [
                                PieChart(
                                  chartLegendSpacing: 32,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 1.2,
                                  legendOptions: LegendOptions(
                                      legendPosition: LegendPosition.right,
                                      legendTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15))),
                                  dataMap: {
                                    "Confirmed": asiaConfirmed.toDouble(),
                                    "Active": asiaActive.toDouble(),
                                    "Recovered": asiaRecovered.toDouble(),
                                    "Deaths": asia.toDouble(),
                                  },
                                  chartValuesOptions: ChartValuesOptions(
                                    chartValueStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                  colorList: [
                                    Colors.red[200],
                                    Colors.blue[200],
                                    Colors.green[200],
                                    Colors.grey[600]
                                  ],
                                ),

// =========================================================
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Divider(
                              thickness: ScreenUtil().setHeight(3),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/europe.png",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Europe",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff6088c4),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: $europe",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Recovered: $europeRecovered",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              children: [
                                PieChart(
                                  chartLegendSpacing: 32,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 1.2,
                                  legendOptions: LegendOptions(
                                      legendPosition: LegendPosition.right,
                                      legendTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15))),
                                  dataMap: {
                                    "Confirmed": europeConfirmed.toDouble(),
                                    "Active": europeActive.toDouble(),
                                    "Recovered": europeRecovered.toDouble(),
                                    "Deaths": europe.toDouble(),
                                  },
                                  chartValuesOptions: ChartValuesOptions(
                                    chartValueStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                  colorList: [
                                    Colors.red[200],
                                    Colors.blue[200],
                                    Colors.green[200],
                                    Colors.grey[600]
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Divider(
                              thickness: ScreenUtil().setHeight(3),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/africa.png",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Africa",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff6088c4),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: $africa",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Recovered: $africaRecovered",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              children: [
                                PieChart(
                                  chartLegendSpacing: 32,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 1.2,
                                  legendOptions: LegendOptions(
                                      legendPosition: LegendPosition.right,
                                      legendTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15))),
                                  dataMap: {
                                    "Confirmed": africaConfirmed.toDouble(),
                                    "Active": africaActive.toDouble(),
                                    "Recovered": africaRecovered.toDouble(),
                                    "Deaths": africa.toDouble(),
                                  },
                                  chartValuesOptions: ChartValuesOptions(
                                    chartValueStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                  colorList: [
                                    Colors.red[200],
                                    Colors.blue[200],
                                    Colors.green[200],
                                    Colors.grey[600]
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Divider(
                              thickness: ScreenUtil().setHeight(3),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/australia.png",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Australia/Oceania",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff6088c4),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: $australia",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Recovered: $australiaRecovered",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              children: [
                                PieChart(
                                  chartLegendSpacing: 32,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 1.2,
                                  legendOptions: LegendOptions(
                                      legendPosition: LegendPosition.right,
                                      legendTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15))),
                                  dataMap: {
                                    "Confirmed": australiaConfirmed.toDouble(),
                                    "Active": australiaActive.toDouble(),
                                    "Recovered": australiaRecovered.toDouble(),
                                    "Deaths": australia.toDouble(),
                                  },
                                  chartValuesOptions: ChartValuesOptions(
                                    chartValueStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                  colorList: [
                                    Colors.red[200],
                                    Colors.blue[200],
                                    Colors.green[200],
                                    Colors.grey[600]
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Divider(
                              thickness: ScreenUtil().setHeight(3),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/northamerica.jpg",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "North America",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff6088c4),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: $northAmerica",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Recovered: $northAmericaRecovered",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              children: [
                                PieChart(
                                  chartLegendSpacing: 32,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 1.2,
                                  legendOptions: LegendOptions(
                                      legendPosition: LegendPosition.right,
                                      legendTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15))),
                                  dataMap: {
                                    "Confirmed":
                                        northAmericaConfirmed.toDouble(),
                                    "Active": northAmericaActive.toDouble(),
                                    "Recovered":
                                        northAmericaRecovered.toDouble(),
                                    "Deaths": northAmerica.toDouble(),
                                  },
                                  chartValuesOptions: ChartValuesOptions(
                                    chartValueStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                  colorList: [
                                    Colors.red[200],
                                    Colors.blue[200],
                                    Colors.green[200],
                                    Colors.grey[600]
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Divider(
                              thickness: ScreenUtil().setHeight(3),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/southamerica.png",
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setWidth(10),
                                  ),
                                  // Spacer(),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "South America",
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff6088c4),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: $southAmerica",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Recovered: $southAmericaRecovered",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              children: [
                                PieChart(
                                  chartLegendSpacing: 32,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 1.2,
                                  legendOptions: LegendOptions(
                                      legendPosition: LegendPosition.right,
                                      legendTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(15))),
                                  dataMap: {
                                    "Confirmed":
                                        southAmericaConfirmed.toDouble(),
                                    "Active": southAmericaActive.toDouble(),
                                    "Recovered":
                                        southAmericaRecovered.toDouble(),
                                    "Deaths": southAmerica.toDouble(),
                                  },
                                  chartValuesOptions: ChartValuesOptions(
                                    chartValueStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(20),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                  colorList: [
                                    Colors.red[200],
                                    Colors.blue[200],
                                    Colors.green[200],
                                    Colors.grey[600]
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Divider(
                              thickness: ScreenUtil().setHeight(3),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: ScreenUtil().setHeight(60),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _DetailBottomSheet(context, index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: ScreenUtil().setHeight(800),
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(5)),
                Image.network(
                  countryData[index]["countryInfo"]['flag'],
                  height: ScreenUtil().setHeight(100),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Text(
                  countryData[index]["country"],
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6088c4),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(3)),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2),
                  children: [
                    StatusPanel(
                      title: "CONFIRMED",
                      panalColor: Colors.red[200],
                      textColor: Colors.red,
                      count: countryData[index]['cases'].toString(),
                    ),
                    StatusPanel(
                      title: "ACTIVE",
                      panalColor: Colors.blue[100],
                      textColor: Colors.blue[900],
                      count: countryData[index]['active'].toString(),
                    ),
                    StatusPanel(
                      title: "RECOVERED",
                      panalColor: Colors.green[100],
                      textColor: Colors.green,
                      count: countryData[index]['recovered'].toString(),
                    ),
                    StatusPanel(
                      title: "DEATHS",
                      panalColor: Colors.grey[400],
                      textColor: Colors.grey[900],
                      count: countryData[index]['deaths'].toString(),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
              ],
            ),
          );
        });
  }
}
