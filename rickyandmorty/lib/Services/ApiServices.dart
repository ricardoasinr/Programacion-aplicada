import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rickyandmorty/Models/Ricky.dart';

class ApiServices {
  final String urlRicky =
      'https://rickandmortyapi.com/api/character/1,2,3,4,183';

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

  Future<List<Ricky>> searchCountries(String? buscar) async {
    final response = await http.get(
      Uri.parse(urlRicky),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      return jsonResponse
          .map((personajes) => Ricky.fromJson(personajes))
          .where((personajes) {
        final id = personajes.id.toString();

        print(personajes);
        //print(jsonResponse);
        return id.contains(buscar!);
      }).toList();
    } else {
      throw Exception('Error al obtener países');
    }
  }
}
