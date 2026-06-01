class ProductModel {
  final int    id;
  final String name;
  final double price;
  final String image;
  final String description;
  final String category;
  final String brand;
  final double rating;
  final double discountPercentage;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.brand,
    required this.rating,
    required this.discountPercentage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id:                 json['id'] ?? 0,
    name:               json['title'] ?? json['name'] ?? '',
    price:              (json['price'] as num?)?.toDouble() ?? 0.0,
    image:              json['thumbnail'] ?? json['image'] ?? '',
    description:        json['description'] ?? '',
    category:           json['category'] ?? '',
    brand:              json['brand'] ?? '',
    rating:             (json['rating'] as num?)?.toDouble() ?? 0.0,
    discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
  );
}