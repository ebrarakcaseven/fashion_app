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
