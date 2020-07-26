import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {
  // const MostAffected({Key key}) : super(key: key);

  final List countrydata;

  MostAffected({this.countrydata});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Image.network(
                countrydata[index]["countryInfo"]["flag"],
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                countrydata[index]["country"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Deaths:" + countrydata[index]["deaths"].toString(),
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
      itemCount: 5,
    ));
  }
}
