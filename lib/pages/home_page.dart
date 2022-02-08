// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:new_design/pages/products_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 850,
                decoration: BoxDecoration(color: Colors.black),
                child: Column(children: [
                  Container(
                    child: Image.asset(
                      "assets/images/kapak_photo.jpg",
                      height: 700,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Products()),
                    ),
                    child: Container(
                      height: 55,
                      width: 210,
                      child: Center(
                          child: Text(
                        "EXPLORE COLLECTİON",
                        style: TextStyle(fontSize: 16),
                      )),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 112, 95, 79),
                        border: Border.all(width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //         <--- border radius here
                            ),
                      ),
                    ),
                  ),
                ]),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("N E W  A R R I V A L",
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItems(index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItems(int index) {
    return Container(
      // color: Colors.blue,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Row(children: [
            RaisedButton(
              child: Text("Hii"),
              onPressed: () {},
            ),
          ])
        ],
      ),
    );
  }
}
