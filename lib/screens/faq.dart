import 'package:Covid_19/data.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ's"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(DataSource.questionAnswers[index]["question"]),
            children: <Widget>[
              Text(DataSource.questionAnswers[index]["answer"]),
            ],
          );
        },
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}
