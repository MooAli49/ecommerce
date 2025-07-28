import 'package:ecommerce/feature/auth/ui/widgets/custom_text_field.dart';
import 'package:ecommerce/feature/checkout/controller/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressStep extends StatelessWidget {
  const AddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<CheckoutCubit>().addressForm,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your address details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Street 1',
              hintText: 'Enter your street address',
              onChanged: (value) {
                context.read<CheckoutCubit>().street1 = value;
              },
              validator: _validator,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Street 2',
              hintText: 'Enter your apartment or suite number',
              onChanged: (value) {
                context.read<CheckoutCubit>().street2 = value;
              },
              validator: _validator,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'City',
              hintText: 'Enter your city',
              onChanged: (value) {
                context.read<CheckoutCubit>().city = value;
              },
              validator: _validator,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: 'State',
                    hintText: 'Enter your state',
                    onChanged: (value) {
                      context.read<CheckoutCubit>().stateLoc = value;
                    },
                    validator: _validator,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    labelText: 'Country',
                    hintText: 'Enter your country',
                    onChanged: (value) {
                      context.read<CheckoutCubit>().country = value;
                    },
                    validator: _validator,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validator(value) {
    if (value!.isEmpty) return "Can't be null";
    return null;
  }
}
