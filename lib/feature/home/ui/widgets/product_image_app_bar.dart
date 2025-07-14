import 'package:ecommerce/core/helper/extensions.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductImageAppBar extends StatelessWidget {
  const ProductImageAppBar({required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 320,
      pinned: true,
      elevation: 0,
      leading: _iconButton(
        context,
        icon: Icons.arrow_back,
        onTap: () => context.pop(),
      ),
      actions: [
        _iconButton(
          context,
          icon: Icons.favorite_border,
          onTap: () {}, // TODO: Add favorite functionality
        ),
        horizontalSpacing(12),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: product.imageUrl,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 80),
          ),
        ),
      ),
    );
  }

  static Widget _iconButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 28,
      ),
      onPressed: onTap,
    );
  }
}