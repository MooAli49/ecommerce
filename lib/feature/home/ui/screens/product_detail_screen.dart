import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/home/data/models/product_model.dart';
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
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 320,
            pinned: true,
            elevation: 0,
            leading: _iconButton(
              context,
              icon: Icons.arrow_back,
              onTap: () => Navigator.of(context).pop(),
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
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 80),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _productDetailsSection(context)),
        ],
      ),
      bottomNavigationBar: _priceAndAddToCartSection(context),
    );
  }

  Widget _iconButton(
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

  Widget _productDetailsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpacing(8),
          Row(
            children: [
              _customChip(label: 'Size', value: product.size),
              horizontalSpacing(12),
              _customChip(label: 'Color', value: product.color),
              horizontalSpacing(12),
            ],
          ),
          verticalSpacing(20),
          _ratingStars(product.rating),
          verticalSpacing(20),
          Text(
            'Description',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          verticalSpacing(8),
          Text(
            product.description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
          verticalSpacing(40),
        ],
      ),
    );
  }

  Widget _customChip({required String label, required String value}) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
      backgroundColor: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  Widget _ratingStars(String rating) {
    final double rate = double.tryParse(rating) ?? 4.5;
    return Row(
      children: [
        ...List.generate(5, (i) {
          return Icon(
            i < rate.round() ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 18,
          );
        }),
        const SizedBox(width: 4),
        Text(rating, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _priceAndAddToCartSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${product.price}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ElevatedButton(
            onPressed: () {}, // TODO: Add to cart functionality
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
