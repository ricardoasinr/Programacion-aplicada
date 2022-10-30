import 'package:banderas/Models/Country.dart';
import 'package:banderas/Screens/CountryScreen.dart';
import 'package:banderas/Services/ApiServices.dart';
import 'package:flutter/material.dart';

class allCountriesScreen extends StatefulWidget {
  const allCountriesScreen({Key? key}) : super(key: key);

  @override
  State<allCountriesScreen> createState() => _allCountriesScreenState();
}

class _allCountriesScreenState extends State<allCountriesScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<List<Country>> futureCountries;
  @override
  void initState() {
    super.initState();
    futureCountries = apiServices.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Lista de países'),
              backgroundColor: Colors.black,
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              }),
            ),
            body: Container(
              child: FutureBuilder<List<Country>>(
                future: futureCountries,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading:
                                Image.network('${snapshot.data![index].flag}'),
                            trailing: TextButton(
                              child: const Text(
                                'Abrir',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                print(
                                    '${snapshot.data![index].name.toString()}');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (CountryScreen(
                                            name:
                                                '${snapshot.data![index].name.toString().toLowerCase()}',
                                          ))),
                                );
                              },
                            ),
                            // ignore: prefer_interpolation_to_compose_strings
                            title: Text('País: ' +
                                snapshot.data![index].name.toString()),
                            subtitle: Text(
                                'Capital: ${snapshot.data![index].capital}'),
                          );
                        }));
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }
                }),
              ),
            )));
  }
}
