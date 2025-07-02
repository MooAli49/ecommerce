import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //categoies
  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      return snapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
