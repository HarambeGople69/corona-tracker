import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeastAffectedPanal extends StatelessWidget {
  final List countryData;
  const LeastAffectedPanal({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(ScreenUtil().setSp(10)),
            child: Row(
              children: [
                Image.network(
                  countryData[index]["countryInfo"]['flag'],
                  height: ScreenUtil().setHeight(50),
                  
                ),
                // SizedBox(
                //   width: ScreenUtil().setWidth(20),
                // ),
                Spacer(),
                Column(
                  children: [
                    Text(
                  countryData[index]['country'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Text(
                  "Recovered: ${countryData[index]['recovered']}",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                )
                  ],
                ),
                
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
