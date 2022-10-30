class Country {
  String? name;
  String? flag;
  String? capital;
  String? moneda;
  String? idioma;

  Country({this.name, this.flag, this.capital, this.moneda, this.idioma});

  factory Country.fromJson(Map<dynamic, dynamic> json) {
    return Country(
      name: json['name'] as String,
      capital: json['capital'] as String?,
      flag: json['flags']['png'] as String,
      //moneda: json['currencies']['name'] as String,
      //idioma: json['languages']['name'] as String);
    );
  }
  factory Country.fromJsonOnlyFlag(Map<dynamic, dynamic> json) {
    return Country(
      flag: json['flags']['png'] as String,
    );
  }
}
