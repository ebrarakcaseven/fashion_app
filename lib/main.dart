import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_design/pages/home_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // ignore: avoid_print
    print('baglantı oldu');
  } catch (e) {
    // ignore: avoid_print
    print('hata');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tenor Sans',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Home(),
    );
  }
}
