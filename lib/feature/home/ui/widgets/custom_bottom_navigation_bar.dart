import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/control_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 12,
        borderRadius: BorderRadius.circular(32),
        shadowColor: Colors.black.withOpacity(0.15),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
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
                    vertical: currentIndex == 0 ? 0 : 8,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        currentIndex == 0
                            ? Icons.home_rounded
                            : Icons.home_outlined,
                        color:
                            currentIndex == 0
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.5),
                        size: 28,
                      ),
                      if (currentIndex == 0)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
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
                    vertical: currentIndex == 1 ? 0 : 8,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        currentIndex == 1
                            ? Icons.shopping_cart_rounded
                            : Icons.shopping_cart_outlined,
                        color:
                            currentIndex == 1
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.5),
                        size: 28,
                      ),
                      if (currentIndex == 1)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
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
                    vertical: currentIndex == 2 ? 0 : 8,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        currentIndex == 2
                            ? Icons.person_rounded
                            : Icons.person_outline,
                        color:
                            currentIndex == 2
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.5),
                        size: 28,
                      ),
                      if (currentIndex == 2)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
                label: '',
              ),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<ControlCubit>().changeScreenIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
