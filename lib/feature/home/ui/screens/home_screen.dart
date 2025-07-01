import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/home/ui/widgets/best_seller_item.dart';
import 'package:ecommerce/feature/home/ui/widgets/best_sellers_header.dart';
import 'package:ecommerce/feature/home/ui/widgets/categories_header.dart';
import 'package:ecommerce/feature/home/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> categories = [
    //   'Men',
    //   'Women',
    //   'Kids',
    //   'Plus Size',
    //   'Unisex',
    //   'New Arrivals',
    //   'Best Sellers',
    // ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchField()),
            SliverToBoxAdapter(child: verticalSpacing(20)),
            SliverToBoxAdapter(child: CategoriesHeader()),
            SliverToBoxAdapter(child: verticalSpacing(20)),
            SliverToBoxAdapter(child: BestSellersHeader()),
            SliverToBoxAdapter(child: verticalSpacing(5)),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => BestSellerItem(index: index),
                childCount: 10, // TODO: change with real data
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
