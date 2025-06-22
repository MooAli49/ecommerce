import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/widgets/headline_text.dart';
import 'package:ecommerce/feature/home/ui/widgets/category_item.dart';
import 'package:flutter/widgets.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key, required this.categories});
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: HeadlineText(text: 'Categories'),
        ),
        verticalSpacing(5),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryItem(categoryItem: categories[index]);
            },
          ),
        ),
      ],
    );
  }
}
