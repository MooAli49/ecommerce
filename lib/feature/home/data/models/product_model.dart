class ProductModel {
  String name;
  String description;
  String imageUrl;
  String price;
  String color;
  String size;
  String rating;

  ProductModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.color,
    required this.size,
    required this.rating,
  });
  ProductModel.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? '',
      description = json['description'] ?? '',
      imageUrl = json['imageUrl'] ?? '',
      price = json['price'] ?? '',
      color = json['color'] ?? '',
      size = json['size'] ?? '',
      rating = json['rating'] ?? '4.5';

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'color': color,
      'size': size,
      'rating': rating,
    };
  }
}
