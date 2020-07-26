import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search({this.countryList});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // TODO: implement buildActions
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element["country"].toString().toLowerCase().startsWith(query))
            .toList(); //iterate throught entire list, co
    return ListView.builder(
      itemCount: suggestionsList.length,
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
                      suggestionsList[index]["country"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.network(
                      suggestionsList[index]["countryInfo"]["flag"],
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
                      "Confirmed:" + suggestionsList[index]["cases"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "Active:" + suggestionsList[index]["active"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Recovered:" +
                          suggestionsList[index]["recovered"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Deaths:" + suggestionsList[index]["deaths"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
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
    );
  }
}
