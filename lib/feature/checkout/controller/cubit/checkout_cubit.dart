import 'package:ecommerce/core/helper/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  int _currentStep = 0;
  int get currentStep => _currentStep;

  Delivery _deliveryType = Delivery.standard;
  Delivery get deliveryType => _deliveryType;

  void goNextStep() {
    if (_currentStep < 2) {
      _currentStep++;
    }
    emit(CheckoutInitial()); //TODO: Update state to reflect current step
  }

  void goPreviousStep() {
    if (_currentStep > 0) {
      _currentStep--;
    }
    emit(CheckoutInitial()); //TODO: Update state to reflect current step
  }

  void setDeliveryType(Delivery delivery) {
    _deliveryType = delivery;

    // Handle delivery type change
    emit(CheckoutInitial()); //TODO: Update state to reflect delivery type
  }
}
