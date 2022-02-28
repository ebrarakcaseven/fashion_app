import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/View/contact_page.dart';
import 'package:new_design/View/home_page.dart';
import 'package:new_design/service/status_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'about_pages.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

StatusService _statusService = StatusService();

class _BlogState extends State<Blog> {
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
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35.0, bottom: 25.0),
                child: Text("B L O G",
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: _statusService.getBlog(),
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
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Image(
                                            height: 130,
                                            image:
                                                NetworkImage(mypost['image'])),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0, top: 8.0),
                                            child: Text("${mypost['title']}",
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text("${mypost['explanation']}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                                      .withOpacity(0.6))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(
                    right: 90.0, left: 90.0, top: 50.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(FontAwesomeIcons.twitter),
                    const Icon(FontAwesomeIcons.instagram),
                    const Icon(FontAwesomeIcons.youtube),
                  ],
                ),
              ),
              Column(
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
                                            style:
                                                const TextStyle(fontSize: 16)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${mypost['phone']}",
                                            style:
                                                const TextStyle(fontSize: 16)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${mypost['workingHours']}",
                                            style:
                                                const TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, top: 50.0, bottom: 40.0),
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
                    padding: const EdgeInsets.only(top: 50.0, bottom: 40.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Contact()),
                      ),
                      child: const Text("Contact",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50.0, top: 50.0, bottom: 40.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
