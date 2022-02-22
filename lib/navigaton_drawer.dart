import 'package:flutter/material.dart';

class NavigatonDrawerWidget extends StatelessWidget {
  const NavigatonDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.transparent),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: Column(children: [
            Material(
              child: Image.asset(
                "assets/images/logo.png",
                height: 120,
                width: 300,
              ),
            )
          ])),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 400,
          child: DefaultTabController(
              length: 3,
              child: Column(children: [
                Container(
                  height: 50,
                  constraints: const BoxConstraints.expand(height: 50),
                  child: const TabBar(
                    tabs: [
                      Tab(text: "WOMEN"),
                      Tab(text: "MAN"),
                      Tab(text: "KİDS"),
                    ],
                    labelColor: Colors.black,
                  ),
                ),
                Expanded(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                      child: TabBarView(children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                        child: Column(children: [
                      ListTile(
                        title: const Text('New'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Apparel'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Bag'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Shoes'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Beauty'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Accessories'),
                        onTap: () {},
                      ),
                    ])),
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: const Text('New'),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: const Text('New'),
                        onTap: () {},
                      ),
                    ),
                  ])),
                )
              ])),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: Text(
            '(786) 713-8616',
            style: TextStyle(color: Colors.black.withOpacity(0.7)),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: Text(
            'Store locator',
            style: TextStyle(color: Colors.black.withOpacity(0.7)),
          ),
          onTap: () {},
        ),
      ]),
    );
  }
}
