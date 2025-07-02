import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../widgets/best_sellers_header.dart';
import '../widgets/categories_header.dart';
import '../widgets/product_grid.dart';
import '../widgets/search_field.dart';

/// The main home screen displaying search, categories, and product grid.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const double _horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 70,
          left: _horizontalPadding,
          right: _horizontalPadding,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SearchField()),
            SliverToBoxAdapter(child: verticalSpacing(20)),
            const SliverToBoxAdapter(child: CategoriesHeader()),
            SliverToBoxAdapter(child: verticalSpacing(20)),
            const SliverToBoxAdapter(child: BestSellersHeader()),
            SliverToBoxAdapter(child: verticalSpacing(5)),
            const ProductGrid(),
          ],
        ),
      ),
    );
  }
}

/// Displays the product grid, handling loading, error, and loaded states.
