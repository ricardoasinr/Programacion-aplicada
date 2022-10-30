class LunesData {
  final String title;
  final String first;
  final String last;
  final String email;
  final String large;

  LunesData({
    required this.title,
    required this.first,
    required this.last,
    required this.email,
    required this.large,
  });

  factory LunesData.fromJson(json) {
    return LunesData(
      title: json['results'][0]['name']['title'],
      first: json['results'][0]['name']['first'],
      last: json['results'][0]['name']['last'],
      email: json['results'][0]['email'],
      large: json['results'][0]['picture']['large'],
    );
  }
}
