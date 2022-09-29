import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resolucionprimerparcial/Models/sabado_data.dart';
import 'package:resolucionprimerparcial/Services/api.dart';

class SabadoScreen extends StatefulWidget {
  const SabadoScreen({super.key});

  @override
  State<SabadoScreen> createState() => _SabadoScreenState();
}

class _SabadoScreenState extends State<SabadoScreen> {
  final ApiServices apiServices = ApiServices();
  final List<SabadoData> listaDondeSeVanAGuardarLasFotos = [];

  Future? getImage() async {
    var image = await apiServices.getDataSabado();
    log(image.message!);
    setState(() {
      listaDondeSeVanAGuardarLasFotos.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Parical del Sábado',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: const Text('Random image')),
            Expanded(
              child: ListView.builder(
                  itemCount: listaDondeSeVanAGuardarLasFotos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(listaDondeSeVanAGuardarLasFotos[
                                  index]
                              .message ??
                          'https://image.ondacero.es/clipping/cmsimages02/2021/09/20/B48108F9-45F3-417A-833D-259BC2CFA304/69.jpg?crop=2400,1350,x0,y0&width=1280&height=720&optimize=low'),
                    );
                  }),
            )
          ]),
        ));
  }
}
