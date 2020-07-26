import 'package:Covid_19/data.dart';
import 'package:Covid_19/screens/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  const Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Faq()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "FAQ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            launch("https://covid-19-response.org/");
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Donate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            launch(
                "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Myth Busters",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
