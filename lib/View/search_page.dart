import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0, left: 20, right: 20),
        child: TextField(
            decoration: InputDecoration(
                hintText: "Search", prefixIcon: Icon(Icons.search))),
      ),
    );
  }
}
