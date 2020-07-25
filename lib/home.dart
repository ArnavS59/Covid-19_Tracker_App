import 'dart:convert';

import 'package:Covid_19/data.dart';
import 'package:Covid_19/widgets/worldwide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Covid-19 Tracker App"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                color: Colors.orange[100],
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "WorldWide",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: RaisedButton(
                    color: primaryBlack,
                    onPressed: () {},
                    child: Text(
                      "Regional",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldWide(
                      worldData: worldData,
                    ),
            ],
          ),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
