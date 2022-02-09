import 'package:flutter/material.dart';

class NavigatonDrawerWidget extends StatelessWidget {
  const NavigatonDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Text("LOGO"),
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
          title: const Text('(786) 713-8616'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Store locator'),
          onTap: () {},
        ),
      ]),
    );
  }
}
