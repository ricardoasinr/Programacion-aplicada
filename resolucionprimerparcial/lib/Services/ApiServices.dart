import 'package:resolucionprimerparcial/Models/data.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final url = 'https://dog.ceo/api/breeds/image/random';

  Future<Datos> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Datos.fromJson(jsonResponse);
    } else {
      throw Exception('Error al pedir fotos');
    }
  }
}
