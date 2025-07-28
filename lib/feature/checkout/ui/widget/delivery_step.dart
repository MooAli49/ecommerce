import 'package:ecommerce/core/helper/enums.dart';
import 'package:ecommerce/feature/checkout/controller/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryStep extends StatelessWidget {
  const DeliveryStep({super.key, required this.deliveryGroupValue});
  final Delivery deliveryGroupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Text(
            'Select Delivery Method',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 20),
        RadioListTile<Delivery>(
          value: Delivery.standard,
          groupValue: deliveryGroupValue,
          onChanged: (value) {
            context.read<CheckoutCubit>().setDeliveryType(value!);
          },
          title: Text(
            'Standard Delivery',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            'Delivery in 3-5 business days',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        RadioListTile<Delivery>(
          value: Delivery.express,
          groupValue: deliveryGroupValue,
          onChanged: (value) {
            context.read<CheckoutCubit>().setDeliveryType(value!);
          },
          title: Text(
            'Express Delivery',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            'Delivery in 1-2 business days',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        RadioListTile<Delivery>(
          value: Delivery.overnight,
          groupValue: deliveryGroupValue,
          onChanged: (value) {
            context.read<CheckoutCubit>().setDeliveryType(value!);
          },
          title: Text(
            'Overnight Delivery',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            'Delivery by next day',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
