import 'package:Covid_19/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Country extends StatefulWidget {
  Country({Key key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Stats"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: Search(countryList: countryData));
            },
          )
        ],
      ),
      body: countryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              countryData[index]["country"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countryData[index]["countryInfo"]["flag"],
                              height: 40,
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Confirmed:" +
                                  countryData[index]["cases"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Active:" +
                                  countryData[index]["active"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "Recovered:" +
                                  countryData[index]["recovered"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              "Deaths:" +
                                  countryData[index]["deaths"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.grey[100]
                                    : Colors.grey[900],
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
