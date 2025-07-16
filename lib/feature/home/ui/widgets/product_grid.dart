import '../../controller/cubit/products_cubit.dart';
import '../../data/models/product_model.dart';
import 'best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductsError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else if (state is ProductsLoaded) {
          final List<ProductModel> products = state.products;
          if (products.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No products available')),
            );
          }
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => BestSellerItem(product: products[index]),
              childCount: products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
