class Country {
  String? name;
  String? flag;
  String? capital;

  Country({this.name, this.flag, this.capital});

  factory Country.fromJson(Map<dynamic, dynamic> json) {
    return Country(
        name: json['name'] as String,
        capital: json['capital'] as String?,
        flag: json['flags']['png'] as String);
  }
}
