import 'package:ecommerce/core/helper/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  int _currentStep = 0;
  int get currentStep => _currentStep;

  Delivery _deliveryType = Delivery.standard;
  Delivery get deliveryType => _deliveryType;

  GlobalKey<FormState> addressForm = GlobalKey<FormState>();

  // بيانات العنوان
  String? street1, city, stateLoc, country;
  double? latitude, longitude;
  String? selectedAddress;

  void goNextStep() {
    if (_currentStep >= 2) return;

    if (_currentStep == 1) {
      final form = addressForm.currentState!;
      if (!form.validate()) return;
    }

    _currentStep++;
    emit(CheckoutStepChanged(_currentStep));
  }

  void goPreviousStep() {
    if (_currentStep > 0) {
      _currentStep--;
    }
    emit(CheckoutStepChanged(_currentStep));
  }

  void setDeliveryType(Delivery delivery) {
    _deliveryType = delivery;
    emit(CheckoutDeliveryUpdated(delivery));
  }

  void setAddressFromMap({
    required double lat,
    required double lng,
    required String street,
    required String cityName,
    required String state,
    required String countryName,
  }) {
    latitude = lat;
    longitude = lng;
    street1 = street;
    city = cityName;
    stateLoc = state;
    country = countryName;

    selectedAddress = '$street, $cityName, $state, $countryName';

    emit(CheckoutAddressUpdated());
  }

  String saveAddress() {
    return '$street1,  $city, $stateLoc, $country';
  }
}
