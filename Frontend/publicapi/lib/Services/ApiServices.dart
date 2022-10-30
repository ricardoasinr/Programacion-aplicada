import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/API.dart';

class ApiServices {
  final url = 'https://api.publicapis.org/entries';

  Future<List<Entries>> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      //Esto es lo nuevo
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["entries"];

      return data.map((countries) => Entries.fromJson(countries)).toList();
    } else {
      throw Exception('Error al pedir paises');
    }
  }
}
