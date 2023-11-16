class PhotoEntity {
  final String id;
  final String name;
  final String imagePath;
  final List<String> places;

  PhotoEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.places,
  });
}
