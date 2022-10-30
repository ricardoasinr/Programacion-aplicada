class Entries {
  String? API;
  String? Description;
  String? Auth;
  String? Cors;
  String? Link;
  String? Category;

  Entries(
      {this.API,
      this.Description,
      this.Auth,
      this.Cors,
      this.Link,
      this.Category});

  factory Entries.fromJson(Map<String, dynamic> json) {
    return Entries(
      API: json['API'] as String,
      Description: json['Description'] as String,
      Auth: json['Auth'] as String,
      Cors: json['Cors'] as String,
      Link: json['Link'] as String,
      Category: json['Category'] as String,
    );
  }
}
