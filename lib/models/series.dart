class Series {
  int id;
  String name;
  int season;
  String image;
  double rating;

  Series({
    required this.id,
    required this.name,
    required this.season,
    required this.image,
    required this.rating,
  });

  // ha kívülről json adat érkezik azt képes legyen fogadni
  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['seriesID'] as int,
      name: json['name'] as String,
      season: json['season'] as int,
      image: json['image'] as String,
      rating: json['rating'] as double,
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
    };
  }
}
