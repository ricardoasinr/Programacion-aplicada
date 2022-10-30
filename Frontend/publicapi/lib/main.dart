import 'package:flutter/material.dart';
import 'package:publicapi/Models/API.dart';
import 'package:publicapi/Services/ApiServices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Publics Apis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Publics Apis'),
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
  late Future<List<Entries>> futureData;
  //late Future<List<API>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = apiServices.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<Entries>>(
          future: futureData,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${snapshot.data![index].API}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Categoria: ${snapshot.data![index].Category}'),
                          Text(
                              'Descripción: ${snapshot.data![index].Description}'),
                          Text('Auth: ${snapshot.data![index].Auth}'),
                          Text('Cors: ${snapshot.data![index].Cors}'),
                          Text(
                            'Link: ${snapshot.data![index].Link}',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                    trailing: Text(''),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
