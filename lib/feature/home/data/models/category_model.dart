class CategoryModel {
  final String name;
  final String imageUrl;

  CategoryModel({required this.name, required this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'imageUrl': imageUrl};
  }

  @override
  String toString() {
    return 'CategoryModel{name: $name, displayImageUrl: $displayImageUrl}';
  }

  String get displayImageUrl {
    // Convert Google Drive share link to direct link if needed
    final regExp = RegExp(r'd/([a-zA-Z0-9_-]+)');
    final match = regExp.firstMatch(imageUrl);
    if (match != null) {
      final fileId = match.group(1);
      return 'https://drive.google.com/uc?export=view&id=$fileId';
    }
    return imageUrl;
  }
}
