class BrandModel {
  final String name;
  final String emoji;

  BrandModel({required this.name, required this.emoji});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
    );
  }
}