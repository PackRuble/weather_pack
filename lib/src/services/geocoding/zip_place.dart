/// Location obtained using zip/post code and country code.
class PlaceZip {
  const PlaceZip({
    required this.zip,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  /// Specified zip/post code in the API request.
  final String zip;

  /// Name of the found location.
  final String name;

  /// Geographical coordinates of the centroid of found zip/post code (latitude).
  final double latitude;

  /// Geographical coordinates of the centroid of found zip/post code (longitude).
  final double longitude;

  /// Country of the found zip/post code.
  final String country;

  factory PlaceZip.fromJson(Map<String, dynamic> json) {
    return PlaceZip(
      zip: json['zip']! as String,
      name: json['name']! as String,
      latitude: json['lat']! as double,
      longitude: json['lon']! as double,
      country: json['country']! as String,
    );
  }

  PlaceZip copyWith({
    String? zip,
    String? name,
    double? latitude,
    double? longitude,
    String? country,
  }) =>
      PlaceZip(
        zip: zip ?? this.zip,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        country: country ?? this.country,
      );

  Map<String, Object?> toJson() => {
        'zip': zip,
        'name': name,
        'lat': latitude,
        'lon': longitude,
        'country': country,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceZip &&
          runtimeType == other.runtimeType &&
          zip == other.zip &&
          name == other.name &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          country == other.country;

  @override
  String toString() =>
      '$PlaceZip(zip: $zip, name: $name, latitude: $latitude, longitude: $longitude, country: $country)';

  @override
  int get hashCode => Object.hash(zip, name, latitude, longitude, country);
}
