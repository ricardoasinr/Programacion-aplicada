import 'package:flutter/material.dart';
import 'package:resolucionprimerparcial/Models/lunes_data.dart';

// ignore: camel_case_types
class randomUser extends StatelessWidget {
  final LunesData data;
  const randomUser({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(data.large),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${data.title}."),
                Text(" ${data.first}"),
                Text(" ${data.last} "),
              ],
            ),
            Text(data.email)
          ],
        ),
      ),
    );
  }
}
