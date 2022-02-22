import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/pages/blog_pages.dart';
import 'package:new_design/pages/collection/detail_page.dart';
import 'package:new_design/pages/contact_page.dart';
import 'package:new_design/pages/details_page.dart';
import 'package:new_design/service/status_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../navigaton_drawer.dart';
import 'about_pages.dart';
import 'home_page.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
          child: Column(children: [
            Container(
              height: 1350,
              child: DefaultTabController(
                  length: 4,
                  child: Column(children: [
                    Container(
                      height: 50,
                      constraints: const BoxConstraints.expand(height: 50),
                      child: const TabBar(
                        tabs: [
                          Tab(text: "Fashion"),
                          Tab(text: "Promo"),
                          Tab(text: "Policy"),
                          Tab(text: "Lookbook"),
                        ],
                        labelColor: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: TabBarView(children: [
                        Container(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: _statusService.getProducts(),
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
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0,
                                              right: 5.0,
                                              top: 15.0,
                                              bottom: 5),
                                          // ignore: avoid_unnecessary_containers
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Details()),
                                                  ),
                                                  child: Image(
                                                      height: 140,
                                                      image: NetworkImage(
                                                          mypost['image'])),
                                                ),
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Text(
                                                          "${mypost['productsBrand']}",
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0,
                                                              left: 8.0),
                                                      child: Text(
                                                          "${mypost['productsName']}",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.6))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Text(
                                                          "${mypost['productsPrice']}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFFDD8560),
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Size:",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 5.0,
                                                                    left: 5.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.6)),
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            15.0))),
                                                                child: Text(
                                                                  " S ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.6)),
                                                                )),
                                                          ),
                                                          Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border.all(
                                                                      color: Colors.black.withOpacity(
                                                                          0.6)),
                                                                  borderRadius:
                                                                      const BorderRadius.all(
                                                                          Radius.circular(
                                                                              15.0))),
                                                              child: Text(" M ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(0.6)))),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors.black.withOpacity(
                                                                            0.6)),
                                                                    borderRadius:
                                                                        const BorderRadius.all(Radius.circular(
                                                                            15.0))),
                                                                child: Text(" L ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color:
                                                                            Colors.black.withOpacity(0.6)))),
                                                          ),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 80.0),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Color(
                                                                  0xFFDD8560),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }
                              }),
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
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${mypost['phone']}",
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${mypost['workingHours']}",
                                          style: const TextStyle(fontSize: 16)),
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
                      MaterialPageRoute(builder: (context) => const Contact()),
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
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
