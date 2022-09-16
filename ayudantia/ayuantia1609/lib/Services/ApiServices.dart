import 'dart:convert';
import 'package:ayuantia1609/Models/Country.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String url =
      'https://restcountries.com/v2/all?fields=name,capital,currencies,flags,languages ';

  Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((countries) => Country.fromJson(countries))
          .toList();
    } else {
      throw Exception('Error al pedir paises');
    }
  }

  Future<List<Country>> searchCountry(String buscar) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((countries) => Country.fromJson(countries))
          .where((countries) {
        final name = countries.name.toString();
        print(countries);
        return name.contains(buscar);
      }).toList();
    } else {
      throw Exception('Error al pedir paises');
    }
  }
}
