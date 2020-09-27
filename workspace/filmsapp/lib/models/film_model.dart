import 'dart:convert';

Film filmFromJson(String str) => Film.fromJson(json.decode(str));

String filmToJson(Film data) => json.encode(data.toJson());

class Film {
  Film({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  dynamic releaseDate;

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };

  getPoster() {
    if (posterPath == null)
      return 'https://pngimage.net/wp-content/uploads/2018/06/image-not-available-png-8.png';
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getBackground() {
    if (backdropPath == null)
      return 'https://pngimage.net/wp-content/uploads/2018/06/image-not-available-png-8.png';
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
