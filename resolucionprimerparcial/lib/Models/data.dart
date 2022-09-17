class Datos {
  final String message;

  Datos({required this.message});

  factory Datos.fromJson(Map<dynamic, dynamic> json) {
    return Datos(message: json['message'] as String);
  }
}
