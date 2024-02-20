class Series {
  int id;
  String name;
  int season;
  String image;
  double rating;
  int userRating;

  Series({
    required this.id,
    required this.name,
    required this.season,
    required this.image,
    required this.rating,
    required this.userRating,
  });

  // szerintem nem használjuk
  factory Series.empty() {
    return Series(
      id: 0,
      name: "",
      season: 0,
      image: "",
      rating: 0,
      userRating: 0,
    );
  }

  // ha kívülről json adat érkezik azt képes legyen fogadni
  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['seriesID'] as int,
      name: json['name'] as String,
      season: json['season'] as int,
      image: json['image'] as String,
      rating: double.parse(json['rating'].toString()), // 2 de azt 2.3
      userRating: json['userRating'] == null ? 0 : json['userRating'] as int,
    );
  }

  // kifelé tudjunk JSON-t küldeni az adatainkból
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "season": season,
      "image": image,
      "rating": rating,
      "userRating": userRating,
    };
  }
}
