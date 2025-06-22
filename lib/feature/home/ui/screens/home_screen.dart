import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/feature/home/controller/cubit/home_cubit.dart';
import 'package:ecommerce/feature/home/ui/widgets/best_seller_item.dart';
import 'package:ecommerce/feature/home/ui/widgets/best_sellers_header.dart';
import 'package:ecommerce/feature/home/ui/widgets/categories_header.dart';
import 'package:ecommerce/feature/home/ui/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0; // TODO: Manage current index state
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
  @override
  Widget build(BuildContext context) {
    final List<Widget> homeScreenBodyWidgets = [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SearchField()),
              SliverToBoxAdapter(child: verticalSpacing(20)),
              SliverToBoxAdapter(
                child: CategoriesHeader(categories: categories),
              ),
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
      ),
    ];

    return Scaffold(
      body: homeScreenBodyWidgets[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 12,
        borderRadius: BorderRadius.circular(32),
        shadowColor: Colors.black.withOpacity(0.15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(
                    vertical: _currentIndex == 0 ? 0 : 8,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _currentIndex == 0
                            ? Icons.home_rounded
                            : Icons.home_outlined,
                        color:
                            _currentIndex == 0
                                ? Colors.blue[700]
                                : Colors.grey[500],
                        size: 28,
                      ),
                      if (_currentIndex == 0)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(
                    vertical: _currentIndex == 1 ? 0 : 8,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _currentIndex == 1
                            ? Icons.shopping_cart_rounded
                            : Icons.shopping_cart_outlined,
                        color:
                            _currentIndex == 1
                                ? Colors.blue[700]
                                : Colors.grey[500],
                        size: 28,
                      ),
                      if (_currentIndex == 1)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(
                    vertical: _currentIndex == 2 ? 0 : 8,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _currentIndex == 2
                            ? Icons.person_rounded
                            : Icons.person_outline,
                        color:
                            _currentIndex == 2
                                ? Colors.blue[700]
                                : Colors.grey[500],
                        size: 28,
                      ),
                      if (_currentIndex == 2)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
                label: '',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              context.read<HomeCubit>().changeHomeIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
