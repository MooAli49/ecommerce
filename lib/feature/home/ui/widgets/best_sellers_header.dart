import 'package:flutter/material.dart';

import '../../../../core/widgets/headline_text.dart';

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
          child: Text(
            'See All',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
