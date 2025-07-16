import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:ecommerce/feature/home/ui/widgets/price_and_add_to_cart.dart';
import 'package:ecommerce/feature/home/ui/widgets/product_details.dart';
import 'package:ecommerce/feature/home/ui/widgets/product_image_app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          ProductImageAppBar(product: product),
          SliverToBoxAdapter(child: ProductDetails(product: product)),
        ],
      ),
      bottomNavigationBar: PriceAndAddToCart(product: product),
    );
  }
}
