import 'package:banderas/Screens/CountryScreen.dart';
import 'package:banderas/Screens/RickyScreen.dart';
import 'package:banderas/Screens/SearchCountryScreen.dart';
import 'package:banderas/Screens/ShakeScreen.dart';
import 'package:banderas/Screens/allCountriesScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ricardo Asin',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Ayudantía 16/09/2022'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (const allCountriesScreen())),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Ver todos los paises',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.red,
              elevation: 0,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (const SearchCountryScreen())),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Buscar país',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (const ShakeScreen())),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Shake',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          (const CountryScreen(name: 'bolivia'))),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Temporal',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (const RickyScreen())),
                );
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Ricky and Morty',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            )
          ],
        ),
      ),
    );
  }
}
