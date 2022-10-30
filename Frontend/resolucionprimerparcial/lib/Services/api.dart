import 'package:resolucionprimerparcial/Models/lunes_data.dart';
import 'package:resolucionprimerparcial/Models/sabado_data.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final urlSabado = 'https://dog.ceo/api/breeds/image/random';
  final urlLunes = 'https://randomuser.me/api/';

  Future<SabadoData> getDataSabado() async {
    final response = await http.get(Uri.parse(urlSabado), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return SabadoData.fromJson(jsonResponse);
    } else {
      throw Exception('Error al pedir fotos');
    }
  }

  Future<LunesData> getDataLunes() async {
    final response = await http.get(Uri.parse(urlLunes), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return LunesData.fromJson(jsonResponse);
    } else {
      throw Exception('Error al pedir fotos');
    }
  }
}
