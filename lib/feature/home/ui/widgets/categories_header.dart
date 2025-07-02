import 'dart:developer';

import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/theme/colors_manger.dart';
import 'package:ecommerce/core/widgets/headline_text.dart';
import 'package:ecommerce/feature/home/controller/cubit/categories_cubit.dart';
import 'package:ecommerce/feature/home/data/models/category_model.dart';
import 'package:ecommerce/feature/home/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: HeadlineText(text: 'Categories'),
        ),
        verticalSpacing(5),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return _loadingIndicator();
            } else if (state is CategoriesError) {
              return _errorWidget(state.message);
            } else if (state is CategoriesLoaded) {
              return _categoriesLoaded(state);
            }
            // Default widget if none of the above conditions are met
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _categoriesLoaded(CategoriesLoaded state) {
    final List<CategoryModel> categories = state.categories;
    log('Categories loaded: $categories');
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

  Widget _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(color: ColorsManger.primaryColor),
    );
  }

  Widget _errorWidget(String error) {
    log('Error loading categories: $error');
    return Center(
      child: Text(
        error,
        style: TextStyle(color: ColorsManger.errorColor, fontSize: 16),
      ),
    );
  }
}
