class Exchange {
  final String id;
  final String name;
  final String country;
  final int yearEstablished;

  Exchange({
    required this.id,
    required this.name,
    required this.country,
    required this.yearEstablished,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) {
    return Exchange(
      id: json['id'],
      name: json['name'],
      country: json['country'] ?? 'Unknown',
      yearEstablished: json['year_established'] ?? 0,
    );
  }
}
