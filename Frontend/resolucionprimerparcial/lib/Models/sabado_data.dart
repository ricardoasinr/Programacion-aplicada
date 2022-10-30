class SabadoData {
  String? message;

  SabadoData({
    this.message,
  });

  factory SabadoData.fromJson(Map<dynamic, dynamic> json) {
    return SabadoData(message: json['message'] as String);
  }
}
