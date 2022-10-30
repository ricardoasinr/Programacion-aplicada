import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:resolucionprimerparcial/Models/lunes_data.dart';
import 'package:resolucionprimerparcial/Services/api.dart';
import 'package:resolucionprimerparcial/Widgets/random_user.dart';

class LunesScreen extends StatefulWidget {
  const LunesScreen({super.key});

  @override
  State<LunesScreen> createState() => _LunesScreenState();
}

class _LunesScreenState extends State<LunesScreen> {
  final ApiServices apiServices = ApiServices();
  final List<LunesData> data = [];

  Future? getData() async {
    var info = await apiServices.getDataLunes();
    log("${info.title}. ${info.first} ${info.last}");
    log(info.email);
    log('--------------');
    setState(() {
      data.add(info);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Parical del Lunes',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: const Text('Random person')),
              Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return randomUser(data: data[index]);
                    }),
              )
            ],
          ),
        ));
  }
}
