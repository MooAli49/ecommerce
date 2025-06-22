import 'package:ecommerce/core/widgets/headline_text.dart';
import 'package:flutter/material.dart';

class BestSellersHeader extends StatelessWidget {
  const BestSellersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: HeadlineText(text: 'Best Sellers'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('See All', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
