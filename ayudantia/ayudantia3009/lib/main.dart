import 'dart:developer';

import 'package:ayudantia3009/Models/lunes_data.dart';
import 'package:ayudantia3009/Services/api.dart';
import 'package:ayudantia3009/Widget/random_user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primer parcial Lunes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Primer parcial Lunes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiServices apiServices = ApiServices();

  final List<Data> data = [];

  Future? getUser() async {
    var user = await apiServices.getData();
    log('${user.title} ${user.first} ${user.last}');
    log('${user.email}');
    log("----------------------------");
    setState(() {
      data.add(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  getUser();
                },
                child: const Text('Get User')),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return RandomUser(data: data[index]);
              },
            ))
          ],
        ),
      ),
    );
  }
}
