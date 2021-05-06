import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
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
                "SYMPTOMS OF COVID-19",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: ScreenUtil().setHeight(35)),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
               Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
                Text(
                  "Most common symptoms:",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "-Fever\n-Dry cough\n-Tiredness",
                      style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setSp(10)),
                      child: Image.asset(
                        "assets/images/symptom1.png",
                        height: ScreenUtil().setHeight(150),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
               Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
                Text(
                  "Less common symptoms:",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10)),
                      child: Image.asset(
                        "assets/images/symptom2.jpg",
                        height: ScreenUtil().setHeight(100),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "-Aches and pains\n-Sore throat\n-Diarrhoea\n-Conjunctivitis\n-Headache\n-Loss of taste or smell\n-A rash on skin, or discolouration of fingers or toes",
                      style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                    )),
                  ],
                ),
               Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
                Text(
                  "Serious symptoms:",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "-Difficulty breathing or shortness of breath\n-Chest pain or pressure\n-Loss of speech or movement",
                      style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10)),
                      child: Image.asset(
                        "assets/images/symptom3.jpg",
                        height: ScreenUtil().setHeight(100),

                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                 Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
                Text(
                  "Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10),),
                Text(
                  "People with mild symptoms who are otherwise healthy should manage their symptoms at home.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10),),
                Text(
                  "On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days.",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                Divider(
                thickness: ScreenUtil().setHeight(3),
              ),
                SizedBox(height: ScreenUtil().setHeight(70),),

              ],
            ),
          ),
        ));
  }
}
