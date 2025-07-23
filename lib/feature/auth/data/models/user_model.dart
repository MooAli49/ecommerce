class UserModel {
  String id, name, email, photoUrl;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });
  UserModel.fromJson(Map<String, dynamic> json)
    : id = json['id'] ?? '',
      name = json['name'] ?? '',
      email = json['email'] ?? '',
      photoUrl = json['photoUrl'] ?? 'default';

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'photoUrl': photoUrl};
  }
}
