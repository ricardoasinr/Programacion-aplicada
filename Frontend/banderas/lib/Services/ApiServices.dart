import 'dart:convert';
import 'dart:developer';

import 'package:banderas/Models/Country.dart';
import 'package:banderas/Models/Ricky.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String url =
      "https://restcountries.com/v2/all?fields=name,capital,flags";

  final String urlRicky =
      'https://rickandmortyapi.com/api/character/1,2,3,4,183';

  Future<List<Country>> searchCountries(String? buscar) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      return jsonResponse
          .map((countries) => Country.fromJson(countries))
          .where((countries) {
        final name = countries.name.toString().toLowerCase();

        print(countries);
        //print(jsonResponse);
        return name.contains(buscar!);
      }).toList();
    } else {
      throw Exception('Error al obtener países');
    }
  }

  Future<List<Country>> getCountries() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      log(response.statusCode.toString());
      return jsonResponse
          .map((countries) => Country.fromJson(countries))
          .toList();
    } else {
      throw Exception('Error al obtener países');
    }
  }

  Future<List<Ricky>> getRicky() async {
    final response = await http.get(
      Uri.parse(urlRicky),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      log(response.statusCode.toString());
      return jsonResponse
          .map((personajes) => Ricky.fromJson(personajes))
          .toList();
    } else {
      throw Exception('Error al obtener personajes');
    }
  }
}
