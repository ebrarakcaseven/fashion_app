import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/pages/about_pages.dart';
import 'package:new_design/pages/blog_pages.dart';
import 'package:new_design/pages/checkout_page.dart';
import 'package:new_design/pages/contact_page.dart';
import 'package:new_design/pages/home_page.dart';
import 'package:new_design/pages/search_page.dart';
import 'package:new_design/service/status_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String _selectedGender = 'black';
  // ignore: prefer_final_fields
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: StreamBuilder<QuerySnapshot>(
                    stream: _statusService.getProducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text(
                          'No Data...',
                        );
                      } else {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
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
                                        Image(
                                            image:
                                                NetworkImage(mypost['image'])),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                  "${mypost['productsBrand']}",
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                  "${mypost['productsName']}",
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                  "${mypost['productsPrice']}",
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFFDD8560),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: [
                                                  const Text("Color"),
                                                  Radio<String>(
                                                    value: 'black',
                                                    groupValue: _selectedGender,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _selectedGender =
                                                            value!;
                                                      });
                                                    },
                                                    activeColor: Colors.black,
                                                  ),
                                                  Radio<String>(
                                                    value: 'orange',
                                                    groupValue: _selectedGender,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _selectedGender =
                                                            value!;
                                                      });
                                                    },
                                                    activeColor:
                                                        const Color(0xFFDD8560),
                                                  ),
                                                  Radio<String>(
                                                    value: 'grey',
                                                    groupValue: _selectedGender,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _selectedGender =
                                                            value!;
                                                      });
                                                    },
                                                    activeColor: Colors.grey,
                                                  ),
                                                  const Text("Size"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, bottom: 20.0),
                                          child: Container(
                                            height: 56.0,
                                            width: 450.0,
                                            color: Colors.black,
                                            child: Row(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.all(17.0),
                                                  child: Text(
                                                    "+ ADD TO BASKET",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 160.0),
                                                  child: Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Text("MATERİALS",
                                            style: TextStyle(fontSize: 16)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text("${mypost['materials']}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                                      .withOpacity(0.6))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50, right: 90.0, left: 90.0),
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
                                                  fontSize: 16)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${mypost['phone']}",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
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
        ));
  }
}
