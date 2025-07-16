import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/spacing.dart';
import '../../controller/cubit/categories_cubit.dart';
import '../../controller/cubit/products_cubit.dart';
import '../widgets/best_sellers_header.dart';
import '../widgets/categories_header.dart';
import '../widgets/product_grid.dart';
import '../widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
    context.read<ProductsCubit>().getProducts();
  }

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
