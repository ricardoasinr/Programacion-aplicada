import 'package:flutter/material.dart';
import 'package:resolucionprimerparcial/Models/data.dart';
import 'package:resolucionprimerparcial/Services/ApiServices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primer Parcial',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Ricardo Asin'),
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
  final ApiServices apiServices = ApiServices();
  final List<Datos> listaDondeSeVanAGuardarLasFotos = [];

  Future? getImage() async {
    var image = await apiServices.getData();
    print(image.message);
    setState(() {
      listaDondeSeVanAGuardarLasFotos.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            child: const Text(
              'Random',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              getImage();
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: listaDondeSeVanAGuardarLasFotos.length,
          itemBuilder: (context, index) {
            return Card(
              child:
                  Image.network(listaDondeSeVanAGuardarLasFotos[index].message),
            );
          }),
    );
  }
}
