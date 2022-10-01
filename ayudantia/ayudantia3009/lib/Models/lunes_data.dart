class Data {
  String? title;
  String? first;
  String? last;
  String? email;
  String? large;
  String? thumbnail;

  Data({
    required this.title,
    required this.first,
    required this.last,
    required this.email,
    required this.large,
    required this.thumbnail,
  });

  factory Data.fromJson(json) {
    return Data(
      title: json['results'][0]['name']['title'],
      first: json['results'][0]['name']['first'],
      last: json['results'][0]['name']['last'],
      email: json['results'][0]['email'],
      large: json['results'][0]['picture']['large'],
      thumbnail: json['results'][0]['picture']['thumbnail'],
    );
  }
}
