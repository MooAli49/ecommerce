class CartProductModel {
  String productId;
  String name;
  String imageUrl;
  num price;
  int quantity;

  CartProductModel({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
  CartProductModel.fromJson(Map<String, dynamic> json)
    : productId = json['productId'] ?? '',
      name = json['name'] ?? '',
      quantity = json['quantity'] ?? '',
      imageUrl = json['image'] ?? '',
      price = json['price'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'quantity': quantity,
      'image': imageUrl,
      'price': price,
    };
  }
}
