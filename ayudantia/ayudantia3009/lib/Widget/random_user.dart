import 'package:ayudantia3009/Models/lunes_data.dart';
import 'package:flutter/material.dart';

class RandomUser extends StatelessWidget {
  final Data data;
  const RandomUser({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: (Center(
        child: Column(children: [
          Image.network('${data.large}'),
          const SizedBox(
            height: 10,
          ),
          Text('${data.title} ${data.first} ${data.last}'),
          Text('${data.email}')
        ]),
      )),
    );
  }
}
