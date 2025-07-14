class CartProductModel {
  String name;
  String imageUrl;
  num price;
  int quantity;

  CartProductModel({
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
  CartProductModel.fromJson(Map<String, dynamic> json)
    : name = json['name'] ?? '',
      quantity = json['quantity'] ?? '',
      imageUrl = json['image'] ?? '',
      price = json['price'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'image': imageUrl,
      'price': price,
    };
  }
}
