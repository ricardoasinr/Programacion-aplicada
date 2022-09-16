import 'package:banderas/Models/Ricky.dart';
import 'package:banderas/Services/ApiServices.dart';
import 'package:flutter/material.dart';

class RickyScreen extends StatefulWidget {
  const RickyScreen({Key? key}) : super(key: key);

  @override
  State<RickyScreen> createState() => _RickyScreenState();
}

class _RickyScreenState extends State<RickyScreen> {
  final ApiServices apiServices = ApiServices();
  late Future<List<Ricky>> futureRicky;
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    futureRicky = apiServices.getRicky();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Ricky & Morty'),
              backgroundColor: Colors.black,
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              }),
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder<List<Ricky>>(
                    future: futureRicky,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: ((context, index) {
                              return card(
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

Widget card({required Ricky ricky, required BuildContext context}) {
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
                      child: Image.network("${ricky.foto}"),
                    )),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ricky.name ?? 'No name',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(ricky.especie ?? 'No tiene especie',
                            style: TextStyle(color: Colors.grey[500])),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(ricky.id.toString() ?? 'No tiene id',
                            style: TextStyle(color: Colors.grey[500])),
                        const SizedBox(
                          height: 5,
                        ),
                      ]),
                )
              ]),
            ),
            MaterialButton(
              onPressed: () {},
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
