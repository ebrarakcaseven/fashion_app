import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/View/home_page.dart';
import 'package:new_design/View/search_page.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigatonDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            ),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "OPEN",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontFamily: 'Tenor Sans'),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nFASHİON',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontFamily: 'Tenor Sans'))
                    ])),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Checkout()),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: const [
            Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 25.0),
              child: Text("C H E C K O U T",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
          ]),
        )));
  }
}
