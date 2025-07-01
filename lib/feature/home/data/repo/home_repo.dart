import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/feature/home/data/models/category_model.dart';

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
}
