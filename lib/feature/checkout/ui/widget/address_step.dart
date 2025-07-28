import 'package:ecommerce/feature/auth/ui/widgets/custom_text_field.dart';
import 'package:ecommerce/feature/checkout/controller/cubit/checkout_cubit.dart';
import 'package:ecommerce/feature/checkout/ui/widget/picke_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressStep extends StatefulWidget {
  const AddressStep({super.key});

  @override
  State<AddressStep> createState() => _AddressStepState();
}

class _AddressStepState extends State<AddressStep> {
  final street1Controller = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void dispose() {
    street1Controller.dispose();
    cityController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();

    return Form(
      key: cubit.addressForm,
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
              labelText: 'Street',
              hintText: 'Enter your street address',
              controller: street1Controller,
              onChanged: (value) => cubit.street1 = value,
              validator: _validator,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'City',
              hintText: 'Enter your city',
              controller: cityController,
              onChanged: (value) => cubit.city = value,
              validator: _validator,
            ),
            const SizedBox(height: 16),
            const SizedBox(width: 16),
            CustomTextField(
              labelText: 'Country',
              hintText: 'Enter your country',
              controller: countryController,
              onChanged: (value) => cubit.country = value,
              validator: _validator,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final LatLng? result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PickAddress()),
                );

                if (result != null) {
                  final placemarks = await placemarkFromCoordinates(
                    result.latitude,
                    result.longitude,
                  );

                  if (placemarks.isNotEmpty) {
                    final place = placemarks.first;

                    cubit.setAddressFromMap(
                      lat: result.latitude,
                      lng: result.longitude,
                      street: place.street ?? '',
                      cityName: place.locality ?? '',
                      state: place.administrativeArea ?? '',
                      countryName: place.country ?? '',
                    );

                    // حدث الـ TextFields
                    setState(() {
                      street1Controller.text = place.street ?? '';
                      cityController.text = place.locality ?? '';
                      countryController.text = place.country ?? '';
                    });
                  }
                }
              },
              child: const Text('Pick your address'),
            ),
            const SizedBox(height: 8),
            if (cubit.selectedAddress != null)
              Text(
                "Selected: ${cubit.selectedAddress!}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  String? _validator(value) {
    if (value == null || value.isEmpty) return "Can't be empty";
    return null;
  }
}
