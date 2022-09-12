class Coord {
  dynamic lon;
  dynamic lat;

  Coord({required this.lon, required this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toMap() {
    return {'lon': lon, 'lat': lat};
  }
}
