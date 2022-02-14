import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_design/navigaton_drawer.dart';
import 'package:new_design/pages/home_page.dart';
import 'package:new_design/service/status_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

StatusService _statusService = StatusService();

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
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
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\nFASHİON',
                        style: TextStyle(color: Colors.black, fontSize: 19))
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
                padding: EdgeInsets.only(top: 50.0),
                child: Text("B L O G",
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: StreamBuilder<QuerySnapshot>(
                    stream: _statusService.getBlog(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text(
                          'no data...',
                        );
                      } else {
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data?.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 10,
                              crossAxisCount: 1,
                              childAspectRatio: 1.5,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot mypost =
                                  snapshot.data!.docs[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 5, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown[50],
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 3.0),
                                            child: CircleAvatar(
                                              backgroundImage: mypost[
                                                          'image'] ==
                                                      ""
                                                  ? const NetworkImage(
                                                      "https://www.gentas.com.tr/wp-content/uploads/2021/05/3190-siyah_renk_g483_1250x1000_t3cksofn.jpg")
                                                  : NetworkImage(
                                                      mypost['image']),
                                              radius: size.height * 0.08,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text("${mypost['title']}",
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                              Text("${mypost['explanation']}",
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ],
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 90.0, left: 90.0, top: 20.0, bottom: 30.0),
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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("support@openui.design",
                        style: TextStyle(fontSize: 15)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("+60 825 876", style: TextStyle(fontSize: 15)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("08:00 - 22:00 - Everyday",
                        style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 50.0, top: 50.0, bottom: 40.0),
                    child: Text("About",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 40.0),
                    child: Text("Contact",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
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
