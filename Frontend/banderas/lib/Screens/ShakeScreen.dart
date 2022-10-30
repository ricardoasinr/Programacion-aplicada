import 'package:flutter/material.dart';

class ShakeScreen extends StatefulWidget {
  const ShakeScreen({Key? key}) : super(key: key);

  @override
  State<ShakeScreen> createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: const Text('Shake'),
          backgroundColor: Colors.black,
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          })),
    ));
  }
}
