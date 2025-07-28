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

  String? street1, city, country;
  double? latitude, longitude;
  String? selectedAddress;

  void goNextStep() {
    if (_currentStep >= 2) {
      reset();
      return;
    }

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

  void reset() {
    _currentStep = 0;
    _deliveryType = Delivery.standard;
    selectedAddress = null;
    emit(CheckoutStepChanged(_currentStep));
  }

  void setAddressFromMap({
    required double lat,
    required double lng,
    required String street,
    required String cityName,

    required String countryName,
  }) {
    latitude = lat;
    longitude = lng;
    street1 = street;
    city = cityName;
    country = countryName;

    selectedAddress = '$street, $cityName, $countryName';

    emit(CheckoutAddressUpdated());
  }

  String showAddress() {
    return '$street1,  $city, $country';
  }
}
