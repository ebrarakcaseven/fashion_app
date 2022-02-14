// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/pages/blog_pages.dart';
import 'package:new_design/pages/products_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_design/service/status_service.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const NavigatonDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          //title: Text("OPEN FASHİON", style: TextStyle(color: Colors.black)),
          title: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "OPEN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\nFASHİON',
                        style: TextStyle(color: Colors.black, fontSize: 19))
                  ])),
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Products()),
                  ),
                  child: Container(
                    height: 55,
                    width: 210,
                    child: const Center(
                        child: Text(
                      "EXPLORE COLLECTİON",
                      style: TextStyle(fontSize: 16),
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
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("N E W  A R R I V A L",
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ),
                // ignore: sized_box_for_whitespace
                Padding(
                  padding: const EdgeInsets.only(left: 27.0, top: 15.0),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 50,
                    child: Center(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _choices.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RaisedButton(
                              child: Text(_choices[index]),
                              textColor: selected == _choices[index]
                                  ? Colors.black
                                  : const Color.fromARGB(255, 126, 119, 119),
                              color: Colors.white,
                              onPressed: () => {
                                setState(() {
                                  selected = _choices[index];
                                }),
                                // ignore: avoid_print
                                print(_choices[index]),
                              },
                            );
                          }),
                    ),
                  ),
                ),
                Container(height: 650, color: Colors.grey),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 750,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("F O L L O W  U S",
                          style: TextStyle(fontSize: 25)),
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
                                                CircleAvatar(
                                                  radius: size.height * 0.09,
                                                  backgroundImage: mypost[
                                                              'image'] ==
                                                          ""
                                                      ? const NetworkImage(
                                                          "https://www.gentas.com.tr/wp-content/uploads/2021/05/3190-siyah_renk_g483_1250x1000_t3cksofn.jpg")
                                                      : NetworkImage(
                                                          mypost['image']),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 90.0,
                                                            right: 45.0),
                                                    child: Text(
                                                        "${mypost['name']}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                  ),
                                                ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 50.0),
                            child: Text("About",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Text("Contact",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18)),
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
