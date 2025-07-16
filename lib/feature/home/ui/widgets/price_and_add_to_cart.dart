import 'dart:developer';

import 'package:ecommerce/core/helper/constants.dart';
import 'package:ecommerce/feature/cart/controller/cubit/cart_cubit.dart';
import 'package:ecommerce/feature/cart/data/model/cart_product_model.dart';
import 'package:ecommerce/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAndAddToCart extends StatelessWidget {
  const PriceAndAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              context.read<CartCubit>().addProductToCart(
                CartProductModel(
                  productId: product.productId,
                  name: product.name,
                  price: product.price,
                  imageUrl: product.imageUrl,
                  quantity: 1,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const CircularProgressIndicator(color: Colors.white);
                } else if (state is CartError) {
                  log('Something Went Wrong: ${product.name}');
                  snackBarMessage(context, state.message, Colors.red);
                  return Text(
                    'Error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is CartProductAdded) {
                  log('Product added to cart: ${product.name}');
                  snackBarMessage(
                    context,
                    'Product added to cart',
                    Colors.green,
                  );
                  return Text(
                    'Added ✔',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (state is CartProductUpdated) {
                  log('Product quantity updated: ${product.name}');
                  snackBarMessage(
                    context,
                    'Product quantity updated',
                    Colors.green,
                  );
                  return Text(
                    'Added ${state.product.quantity}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
