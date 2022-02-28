import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/service/status_service.dart';

import '../navigaton_drawer.dart';
import 'home_page.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  // ignore: prefer_final_fields
  StatusService _statusService = StatusService();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const NavigatonDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          //title: Text("OPEN FASHİON", style: TextStyle(color: Colors.black)),
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
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("OUR STORY", style: TextStyle(fontSize: 25)),
              ),
            ),
            Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: _statusService.getAbout(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text(
                          'No Data...',
                        );
                      } else {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot mypost =
                                  snapshot.data!.docs[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  // ignore: avoid_unnecessary_containers
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 15.0),
                                          child: Text("${mypost['text1']}",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(fontSize: 16)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 25.0),
                                          child: Text("${mypost['text2']}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 40.0),
                                          child: Image.asset(
                                              "assets/images/aboutImage.png"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Text(
                      "Receive early access to new arrivals, sales, exclusive content, events and much more!",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Email adress',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                      height: 55,
                      width: size.width,
                      color: Colors.black,
                      child: const Center(
                          child: Text("SUBMİT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )))),
                )
              ],
            )
          ],
        )));
  }
}
