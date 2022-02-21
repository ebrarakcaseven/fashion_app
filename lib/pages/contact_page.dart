// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/pages/about_pages.dart';
import 'package:new_design/pages/blog_pages.dart';
import 'package:new_design/pages/home_page.dart';
import 'package:new_design/service/status_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  StatusService _statusService = StatusService();
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
            child: Center(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 25.0),
              child: Text("C O N T A C T  U S",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _statusService.getContactUs(),
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
                          DocumentSnapshot mypost = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.0, bottom: 20.0),
                                  child: Icon(
                                    Icons.chat,
                                    color: Color(0xFFDD8560),
                                    size: 50,
                                  ),
                                ),
                                Text("${mypost['text1']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      height: 45,
                                      width: 187,
                                      color: Colors.black,
                                      child: const Center(
                                        child: Text("CHAT WİTH US",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                      )),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 60.0, bottom: 20.0),
                                  child: Icon(
                                    Icons.mail_outline,
                                    color: Color(0xFFDD8560),
                                    size: 50,
                                  ),
                                ),
                                Text("${mypost['text2']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      height: 45,
                                      width: 130,
                                      color: Colors.black,
                                      child: const Center(
                                        child: Text("TEXT US",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                      )),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 60.0, bottom: 20.0),
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Color(0xFFDD8560),
                                    size: 50,
                                  ),
                                ),
                                Text("${mypost['text3']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6))),
                              ],
                            ),
                          );
                        });
                  }
                }),
            Container(
              height: 350,
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 90.0, left: 90.0, top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(FontAwesomeIcons.twitter, color: Colors.black),
                      const Icon(FontAwesomeIcons.instagram,
                          color: Colors.black),
                      const Icon(FontAwesomeIcons.youtube, color: Colors.black),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: _statusService.getContact(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text(
                                'no data...',
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
                                    // ignore: avoid_unnecessary_containers
                                    return Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("${mypost['email']}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("${mypost['phone']}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "${mypost['workingHours']}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          }),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      // ignore: prefer_const_constructors
                      padding: const EdgeInsets.only(
                          left: 50.0, top: 50.0, bottom: 20.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const About()),
                        ),
                        child: const Text("About",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Contact()),
                        ),
                        child: const Text("Contact",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 50.0, top: 50.0, bottom: 20.0),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Blog()),
                        ),
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: const Text("Blog",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ]),
        )));
  }
}
