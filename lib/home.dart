import 'dart:convert';

import 'package:Covid_19/data.dart';
import 'package:Covid_19/widgets/mostaffected.dart';
import 'package:Covid_19/widgets/worldwide.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './widgets/info.dart';
import './screens/country.dart';

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

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries?sort=cases");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Theme.of(context).brightness == Brightness.light
                    ? Icons.lightbulb_outline
                    : Icons.highlight),
                onPressed: () {
                  DynamicTheme.of(context).setBrightness(
                      Theme.of(context).brightness == Brightness.light
                          ? Brightness.dark
                          : Brightness.light);
                })
          ],
          centerTitle: false,
          title: Text(
            'COVID-19 TRACKER',
          ),
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Country()));
                    },
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Most Affected Countries",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              countryData == null
                  ? Container()
                  : MostAffected(
                      countrydata: countryData,
                    ),
              Info(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "We are together in this Fight",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
