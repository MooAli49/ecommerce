import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CartError) {
          return Scaffold(body: Center(child: Text(state.message)));
        } else if (state is CartLoaded) {
          final products = state.products;
          if (products.isEmpty) {
            return Scaffold(body: _showEmptyCartImage());
          }
          double total = products.fold(
            0,
            (sum, item) => sum + (item.price * item.quantity),
          );
          return Scaffold(
            body: Column(
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
            ),
          );
        }
        return Scaffold(body: const SizedBox.shrink());
      },
    );
  }

  Widget _showEmptyCartImage() {
    print('safaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/cart_empty.svg',
            width: 200,
            height: 200,
          ),
        ),
        const Center(child: Text('Your cart is empty.')),
      ],
    );
  }

  void _showRemoveSnackBar() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Product removed from cart')));
  }
}
