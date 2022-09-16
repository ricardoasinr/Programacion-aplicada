import 'package:ayuantia1609/CountryScreen.dart';
import 'package:ayuantia1609/Models/Country.dart';
import 'package:ayuantia1609/Services/ApiServices.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Países'),
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
  late Future<List<Country>> futureCountries;

  @override
  void initState() {
    super.initState();
    futureCountries = apiServices.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder<List<Country>>(
            future: futureCountries,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network("${snapshot.data![index].flag}"),
                      title: Text('${snapshot.data![index].name}'),
                      subtitle: Text('${snapshot.data![index].capital}'),
                      trailing: MaterialButton(
                        onPressed: () {
                          print('${snapshot.data![index].name}');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (CountryScreen(
                                        name: '${snapshot.data![index].name}',
                                      ))));
                        },
                        child: Icon(Icons.info),
                      ),
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
          ),
        ));
  }
}
