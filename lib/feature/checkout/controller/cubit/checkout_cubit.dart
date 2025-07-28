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

  late String street1, street2, city, stateLoc, country;

  void goNextStep() {
    if (_currentStep >= 2) return;

    if (_currentStep == 1) {
      final form = addressForm.currentState!;
      form;
      if (!form.validate()) return;
    }

    _currentStep++;

    emit(CheckoutInitial()); //TODO: Update state to reflect current step
  }

  String saveAddress() {
    return '$street1,$street2,$city,$stateLoc,$country';
  }

  void goPreviousStep() {
    if (_currentStep > 0) {
      _currentStep--;
    }
    emit(CheckoutInitial()); //TODO: Update state to reflect current step
  }

  void setDeliveryType(Delivery delivery) {
    _deliveryType = delivery;
    emit(CheckoutInitial()); //TODO: Update state to reflect delivery type
  }
}
