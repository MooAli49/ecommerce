import 'package:ecommerce/feature/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddressStep extends StatelessWidget {
  const AddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your address details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          labelText: 'Street 1',
          hintText: 'Enter your street address',
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          labelText: 'Street 2',
          hintText: 'Enter your apartment or suite number',
        ),
        const SizedBox(height: 16),
        const CustomTextField(labelText: 'City', hintText: 'Enter your city'),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: CustomTextField(
                labelText: 'State',
                hintText: 'Enter your state',
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                labelText: 'Country',
                hintText: 'Enter your country',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
