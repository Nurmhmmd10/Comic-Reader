class Comic{
  final int id;
  final String title;
  final String image;
  final String genre;
  final String synopsis;
  final double rating;
  final int totalChapters;

  Comic({
    required this.id,
    required this.title,
    required this.image,
    required this.genre,
    required this.synopsis,
    required this.rating,
    required this.totalChapters,
  });

  factory Comic.fromJson(Map<String, dynamic> j) {
    return Comic(
      id: int.parse(j['id'].toString()),
      title: j['title'] ?? '',
      image: j['image'] ?? '',
      genre: j['genre'] ?? '',
      synopsis: j['synopsis'] ?? '',
      rating: double.tryParse(j['rating']?.toString() ?? '') ?? 0.0,
      totalChapters: int.tryParse(j['totalChapters']?.toString() ?? '') ?? (int.tryParse(j['chapter']?.toString().replaceAll(RegExp(r'[^0-9]'), '') ?? '') ?? 0),
    );
  }
}