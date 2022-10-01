import 'dart:convert';
import 'dart:developer';

import 'package:ayudantia3009/Models/lunes_data.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final url = 'https://randomuser.me/api/';

  Future<Data> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    log('${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Data.fromJson(jsonResponse);
    } else {
      throw Exception('Error al pedir usuarios');
    }
  }
}
