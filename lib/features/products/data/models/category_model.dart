
class CategoryModel {
  final String id;
  final String name;
  final String image;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id:    (json['_id'] ?? json['id'] ?? '').toString(),
    name:  json['name']  ?? '',
    image: json['image'] ?? json['thumbnail'] ?? '',
  );
}