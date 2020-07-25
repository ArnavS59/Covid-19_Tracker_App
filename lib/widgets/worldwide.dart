import 'package:flutter/material.dart';

class WorldWide extends StatelessWidget {
  //const WorldWide({Key key}) : super(key: key);

  final Map worldData;
  WorldWide({this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldData["cases"].toString(),
            title: "Confirmed",
          ),
          StatusPanel(
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: worldData["active"].toString(),
            title: "Active",
          ),
          StatusPanel(
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldData["recovered"].toString(),
            title: "REcovered",
          ),
          StatusPanel(
            panelColor: Colors.grey[300],
            textColor: Colors.grey,
            count: worldData["deaths"].toString(),
            title: "Deaths",
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  //const StatusPanel({Key key}) : super(key: key);

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  StatusPanel({this.count, this.panelColor, this.textColor, this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      color: panelColor,
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
        ],
      ),
    );
  }
}
