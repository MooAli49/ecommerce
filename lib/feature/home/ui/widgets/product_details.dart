import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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

  static Widget _customChip({required String label, required String value}) {
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

  static Widget _ratingStars(String rating) {
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
}
