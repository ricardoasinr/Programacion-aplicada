import 'package:ayuantia1609/Models/Country.dart';
import 'package:ayuantia1609/Services/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryScreen extends StatefulWidget {
  final name;
  const CountryScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<List<Country>> futureCountries;

  @override
  void initState() {
    super.initState();
    futureCountries = apiServices.searchCountry(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('País seleccionado'),
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
                itemBuilder: (context, index) {
                  return cardCountry(
                      country: snapshot.data![index], context: context);
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
      ),
    ));
  }
}

Widget cardCountry({required Country country, required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        const Padding(padding: EdgeInsets.all(20)),
        Container(
          child: Image.network(
            "${country.flag}",
            scale: 1,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(country.name ?? 'No name',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 5,
              ),
              Text('Capital: ${country.capital}' ?? 'No tiene capital',
                  style: TextStyle(color: Colors.grey[500], fontSize: 15)),
              const SizedBox(
                height: 5,
              ),
            ]),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
