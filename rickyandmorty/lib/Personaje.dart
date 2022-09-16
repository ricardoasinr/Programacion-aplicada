import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rickyandmorty/Models/Ricky.dart';
import 'package:rickyandmorty/Services/ApiServices.dart';

class PersonajeScreen extends StatefulWidget {
  final String name;
  const PersonajeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<PersonajeScreen> createState() => _PersonajeScreenState();
}

class _PersonajeScreenState extends State<PersonajeScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<List<Ricky>> futurePersonaje;
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    futurePersonaje = apiServices.searchCountries(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Personaje'),
              backgroundColor: Colors.black,
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              }),
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder<List<Ricky>>(
                    future: futurePersonaje,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: ((context, index) {
                              return personajeScreen(
                                  ricky: snapshot.data![index],
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

Widget personajeScreen({required Ricky ricky, required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        const Padding(padding: EdgeInsets.all(20)),
        Container(
          child: Image.network(
            "${ricky.foto}",
            scale: 1,
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(ricky.name ?? 'No name',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 5,
              ),
              Text('ID: ${ricky.id}' ?? 'No tiene id',
                  style: TextStyle(color: Colors.grey[500], fontSize: 15)),
              const SizedBox(
                height: 5,
              ),
              Text('Especie: ${ricky.especie}' ?? 'No tiene especie',
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
