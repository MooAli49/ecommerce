import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
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
        prefixIcon: const Icon(Icons.search, size: 22),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }
}
