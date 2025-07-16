import 'package:flutter/material.dart';

class CartTotalFooter extends StatelessWidget {
  final double total;
  const CartTotalFooter({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            //TODO implement checkout
          },
          child: const Text('Checkout'),
        ),
      ],
    );
  }
}
