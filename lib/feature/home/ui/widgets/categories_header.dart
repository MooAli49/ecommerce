import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../data/models/category_model.dart';
import 'category_item.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(name: 'Men', imageUrl: 'assets/images/men.jpg'),
      CategoryModel(name: 'Women', imageUrl: 'assets/images/women.jpg'),
      CategoryModel(name: 'Kids', imageUrl: 'assets/images/kids.jpg'),
      CategoryModel(name: 'Plus Size', imageUrl: 'assets/images/plus_size.jpg'),
      CategoryModel(name: 'Unisex', imageUrl: 'assets/images/men.jpg'),
    ];

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        verticalSpacing(5),
        _buildCategories(categories),
      ],
    );
  }

  Widget _buildCategories(List<CategoryModel> categories) {
    if (categories.isEmpty) {
      return Center(child: Text('No categories available'));
    }

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(categoryModel: categories[index]);
        },
      ),
    );
  }
}
