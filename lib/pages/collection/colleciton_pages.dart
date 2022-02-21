import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/pages/about_pages.dart';
import 'package:new_design/pages/blog_pages.dart';
import 'package:new_design/pages/collection/detail_page.dart';
import 'package:new_design/pages/contact_page.dart';
import 'package:new_design/pages/home_page.dart';
import 'package:new_design/service/status_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  // ignore: prefer_final_fields, unused_field
  StatusService _statusService = StatusService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatonDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Tenor Sans'),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\nFASHİON',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Tenor Sans'))
                  ])),
        ),
        // iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 45.0, top: 45.0),
          child: Text("OCTOBER COLLECTİON",
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: _statusService.getCollection(),
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
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: Column(
                              children: [
                                Image(image: NetworkImage(mypost['image'])),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 30.0),
                                  child: Text("${mypost['title']}",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
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
                  const Icon(FontAwesomeIcons.instagram, color: Colors.black),
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
                                        child: Text("${mypost['workingHours']}",
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
                  padding: EdgeInsets.only(left: 50.0, top: 50.0, bottom: 20.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const About()),
                    ),
                    child: const Text("About",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Contact()),
                    ),
                    child: const Text("Contact",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
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
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ])),
    );
  }
}
