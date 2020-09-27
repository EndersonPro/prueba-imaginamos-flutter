import 'dart:convert';

FilmSearch filmSearchFromJson(String str) =>
    FilmSearch.fromJson(json.decode(str));

String filmSearchToJson(FilmSearch data) => json.encode(data.toJson());

class FilmSearch {
  FilmSearch({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  int id;
  String logoPath;
  String name;
  String originCountry;

  factory FilmSearch.fromJson(Map<String, dynamic> json) => FilmSearch(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
