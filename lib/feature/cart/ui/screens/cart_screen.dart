import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/cart_cubit.dart';
import '../widgets/cart_item_row.dart';
import '../widgets/cart_total_footer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else if (state is CartLoaded) {
            final products = state.products;
            if (products.isEmpty) {
              return const Center(child: Text('Your cart is empty.'));
            }
            double total = products.fold(
              0,
              (sum, item) => sum + (item.price * item.quantity),
            );
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CartItemRow(
                        product: products[index],
                        onRemove: _showRemoveSnackBar,
                      );
                    },
                  ),
                ),
                CartTotalFooter(total: total),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showRemoveSnackBar() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Product removed from cart')));
  }
}
