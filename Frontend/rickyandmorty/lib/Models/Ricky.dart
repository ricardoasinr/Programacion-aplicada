class Ricky {
  int? id;
  String? name;
  String? foto;
  String? especie;

  Ricky({this.id, this.name, this.foto, this.especie});

  factory Ricky.fromJson(Map<dynamic, dynamic> json) {
    return Ricky(
      id: json['id'] as int?,
      name: json['name'] as String,
      especie: json['species'] as String?,
      foto: json['image'] as String?,
    );
  }
}
