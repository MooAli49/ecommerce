import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/cart_cubit.dart';
import '../../data/model/cart_product_model.dart';

class CartItemRow extends StatelessWidget {
  final CartProductModel product;
  final VoidCallback onRemove;
  const CartItemRow({super.key, required this.product, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product.productId),
      onDismissed: (direction) {
        context.read<CartCubit>().removeProductFromCart(product.productId);
        onRemove();
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Confirm Removal'),
                content: const Text(
                  'Are you sure you want to remove this item?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Remove'),
                  ),
                ],
              ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProductImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  _buildQuantityControls(context),
                ],
              ),
            ),
          ),
          _buildPrice(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 90,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(product.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        product.name,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<CartCubit>().increaseProductQuantity(
              product.productId,
            );
          },
          icon: const Icon(Icons.add),
        ),
        Text(product.quantity.toString()),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<CartCubit>().decreaseProductQuantity(
              product.productId,
            );
          },
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '\$${product.price.toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 16, color: Colors.green),
      ),
    );
  }
}
