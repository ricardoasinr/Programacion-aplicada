import 'package:banderas/Models/Country.dart';
import 'package:banderas/Screens/CountryScreen.dart';
import 'package:banderas/Services/ApiServices.dart';
import 'package:flutter/material.dart';

class SearchCountryScreen extends StatefulWidget {
  const SearchCountryScreen({Key? key}) : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<List<Country>> futureCountries;
  TextEditingController editingController = TextEditingController();
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
              title: const Text('Buscar país'),
              backgroundColor: Colors.black,
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              }),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        futureCountries = apiServices.searchCountries(value);
                      });
                    },
                    controller: editingController,
                    decoration: const InputDecoration(
                        labelText: "Buscar",
                        hintText: "Buscar por nombre",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Country>>(
                    future: futureCountries,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: ((context, index) {
                              return cardCountry(
                                  country: snapshot.data![index],
                                  context: context);
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
                ),
              ],
            )));
  }
}

Widget cardCountry({required Country country, required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(children: [
                Container(
                    width: 100,
                    height: 60,
                    child: ClipRRect(
                      child: Image.network("${country.flag}"),
                    )),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(country.name ?? 'No name',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(country.capital ?? 'No tiene capital',
                            style: TextStyle(color: Colors.grey[500])),
                        const SizedBox(
                          height: 5,
                        ),
                      ]),
                )
              ]),
            ),
            MaterialButton(
              onPressed: () {
                print(country.name);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (CountryScreen(
                            name: '${country.name.toString().toLowerCase()}',
                          ))),
                );
              },
              child: Icon(Icons.info),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
