import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: const [
      Padding(
        padding: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search items', prefixIcon: Icon(Icons.search)),
        ),
      )
    ]));
  }
}
