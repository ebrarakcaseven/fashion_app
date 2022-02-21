// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/pages/blog_pages.dart';
import 'package:new_design/pages/collection/colleciton_pages.dart';
import 'package:new_design/pages/contact_page.dart';
import 'package:new_design/pages/products_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_design/service/status_service.dart';

import 'about_pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageList = [
    "https://static.zara.net/photos///2022/V/0/1/p/2403/707/500/2/w/610/2403707500_2_1_1.jpg?ts=1643968216848",
    'https://static.zara.net/photos///2022/V/0/1/p/2631/636/687/2/w/610/2631636687_2_1_1.jpg?ts=1643980332917',
    'https://static.zara.net/photos///2022/V/0/1/p/4341/704/620/2/w/610/4341704620_1_1_1.jpg?ts=1643806511076',
    'https://static.zara.net/photos///2022/V/0/1/p/5584/018/615/2/w/610/5584018615_15_1_1.jpg?ts=1643974313743'
  ];

  // ignore: prefer_final_fields
  List<String> _choices = <String>['All', 'Apparel', 'Dress', 'Bag'];
  String answer = "All";
  String selected = "All";

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
          title: RichText(
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
          iconTheme: const IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 9.0),
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: CarouselSlider.builder(
                      itemCount: imageList.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 640,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        reverse: false,
                        aspectRatio: 5.0,
                      ),
                      itemBuilder: (context, i, id) {
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                imageList[i],
                                width: 500,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () {
                            var url = imageList[i];
                            // ignore: avoid_print
                            print(url.toString());
                          },
                        );
                      },
                    ),
                  ),
                ),
                InkWell(
                  /*onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Products()),
                  ),*/
                  child: Container(
                    height: 55,
                    width: 210,
                    child: const Center(
                        child: Text(
                      "EXPLORE COLLECTİON",
                      style: TextStyle(fontSize: 15),
                    )),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 239, 239),
                      border: Border.all(width: 1.0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 60.0, bottom: 30.0),
                  child: Text("N E W  A R R I V A L",
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 650,
                  child: DefaultTabController(
                      length: 4,
                      child: Column(children: [
                        Container(
                          height: 50,
                          constraints: const BoxConstraints.expand(height: 50),
                          child: const TabBar(
                            tabs: [
                              Tab(text: "All"),
                              Tab(text: "Dress"),
                              Tab(text: "Tsirt"),
                              Tab(text: "Bag"),
                            ],
                            labelColor: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              child: TabBarView(children: [
                            Container(
                              child: Column(
                                children: [
                                  StreamBuilder<QuerySnapshot>(
                                      stream: _statusService.getProducts(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return const Text(
                                            'no data...',
                                          );
                                        } else {
                                          return GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: 4,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 2,
                                                crossAxisSpacing: 2,
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.9,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                DocumentSnapshot mypost =
                                                    snapshot.data!.docs[index];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5.0,
                                                          top: 15.0,
                                                          bottom: 5),
                                                  // ignore: avoid_unnecessary_containers
                                                  child: Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image(
                                                            height: 140,
                                                            image: NetworkImage(
                                                                mypost[
                                                                    'image'])),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0,
                                                                  left: 5.0),
                                                          child: Text(
                                                              "${mypost['productsName']}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          13)),
                                                        ),
                                                        Text(
                                                            "${mypost['productsPrice']}",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13)),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        }
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0, bottom: 20.0),
                                    child: Container(
                                        height: 60,
                                        width: 200,
                                        color: Colors.white,
                                        child: Center(
                                            child: InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Products()),
                                          ),
                                          child: const Text("Explore More ->",
                                              style: TextStyle(fontSize: 20)),
                                        ))),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Text("b"),
                            ),
                            Container(
                              height: 50,
                              child: Text("c"),
                            ),
                            Container(
                              height: 50,
                              child: Text("d"),
                            ),
                          ])),
                        )
                      ])),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "C O L L E C T İ O N S",
                    style: TextStyle(fontSize: 24),
                  ),
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
                            itemCount: 1,
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
                                        InkWell(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Collection()),
                                          ),
                                          child: Image(
                                              image: NetworkImage(
                                                  mypost['image'])),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 850,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20.0),
                        child: Text("F O L L O W  U S",
                            style: TextStyle(fontSize: 25)),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: _statusService.getFollow(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text(
                                'no data...',
                              );
                            } else {
                              return GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?.docs.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 2,
                                    crossAxisSpacing: 2,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    DocumentSnapshot mypost =
                                        snapshot.data!.docs[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15,
                                          top: 5,
                                          bottom: 10),
                                      // ignore: avoid_unnecessary_containers
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Image(
                                                    height: 130,
                                                    image: NetworkImage(
                                                        mypost['image'])),
                                                Text("${mypost['name']}",
                                                    style: const TextStyle(
                                                        fontSize: 18)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.only(right: 90.0, left: 90.0),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      "${mypost['email']}",
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      "${mypost['phone']}",
                                                      style: const TextStyle(
                                                          fontSize: 16)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      "${mypost['workingHours']}",
                                                      style: const TextStyle(
                                                          fontSize: 16)),
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
                            padding: EdgeInsets.only(left: 50.0, top: 50.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const About()),
                              ),
                              child: const Text("About",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Contact()),
                              ),
                              child: const Text("Contact",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 50.0, top: 50.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Blog()),
                              ),
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: const Text("Blog",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
