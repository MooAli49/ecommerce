import 'package:ecommerce/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryItem});
  final String categoryItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.category, size: 30, color: Colors.black54),
          ),
          verticalSpacing(5),
          Text(categoryItem),
        ],
      ),
    );
  }
}
