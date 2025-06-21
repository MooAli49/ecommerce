import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/widgets/headline_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Electronics',
      'Fashion',
      'Home & Garden',
      'Sports',
      'Toys & Games',
      'Health & Beauty',
      'Automotive',
      'Books',
      'Music',
      'Movies & TV',
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _searchField()),
              SliverToBoxAdapter(child: verticalSpacing(20)),
              SliverToBoxAdapter(child: _categoriesSection(categories)),
              SliverToBoxAdapter(child: verticalSpacing(20)),
              SliverToBoxAdapter(child: _bestSellersHeader()),
              SliverToBoxAdapter(child: verticalSpacing(5)),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _bestSellerItem(index),
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
      ),
    );
  }

  Widget _searchField() {
    return TextField(
      onChanged: (value) {
        //TODO Handle search input changes
        print('Search query: $value');
      },
      decoration: InputDecoration(
        labelText: 'Search',
        hintText: 'Search for products, categories, etc.',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search, size: 22),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }

  Widget _categoriesSection(List<String> categories) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: HeadlineText(text: 'Categories'),
        ),
        verticalSpacing(5),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _categoryItem(categories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryItem(String categoryItem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.category, size: 30, color: Colors.black54),
          ),
          verticalSpacing(5),
          Text(categoryItem),
        ],
      ),
    );
  }

  Widget _bestSellersHeader() {
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

  Widget _bestSellerItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Section
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: AssetImage('assets/images/test_chair.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Favorite button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Product Info Section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Name
                  Text(
                    'Product Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Product Brand
                  Text(
                    'Product Brand',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Price and Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$300',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.amber),
                          SizedBox(width: 2),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
