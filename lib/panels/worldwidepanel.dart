import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorldWidePanel extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Map WorldData;

  // ignore: non_constant_identifier_names
  const WorldWidePanel({Key key, this.WorldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title: "CONFIRMED",
            panalColor: Colors.red[200],
            textColor: Colors.red,
            count: WorldData['cases'].toString(),
          ),
          StatusPanel(
            title: "ACTIVE",
            panalColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: WorldData['active'].toString(),
          ),
          StatusPanel(
            title: "RECOVERED",
            panalColor: Colors.green[100],
            textColor: Colors.green,
            count: WorldData['recovered'].toString(),
          ),
          StatusPanel(
            title: "DEATHS",
            panalColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: WorldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panalColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panalColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setSp(5)),
      color: panalColor,
      height: ScreenUtil().setHeight(80),
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16)),
          ),
          Text(
            count,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(16)),
          )
        ],
      ),
    );
  }
}
