import 'dart:developer';

import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/home/controller/cubit/products_cubit.dart';
import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:ecommerce/feature/home/ui/widgets/best_seller_item.dart';
import 'package:ecommerce/feature/home/ui/widgets/best_sellers_header.dart';
import 'package:ecommerce/feature/home/ui/widgets/categories_header.dart';
import 'package:ecommerce/feature/home/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchField()),
            SliverToBoxAdapter(child: verticalSpacing(20)),
            SliverToBoxAdapter(child: CategoriesHeader()),
            SliverToBoxAdapter(child: verticalSpacing(20)),
            SliverToBoxAdapter(child: BestSellersHeader()),
            SliverToBoxAdapter(child: verticalSpacing(5)),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is ProductsError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  );
                } else if (state is ProductsLoaded) {
                  final List<ProductModel> products = state.products;
                  log(
                    'Products loaded: ${products.length}',
                    name: 'HomeScreen',
                  );
                  if (products.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text('No products available')),
                    );
                  }
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          BestSellerItem(product: products[index]),
                      childCount: products.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  );
                }
                return SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}
