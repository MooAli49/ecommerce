part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutStepChanged extends CheckoutState {
  final int step;
  CheckoutStepChanged(this.step);
}

final class CheckoutDeliveryUpdated extends CheckoutState {
  final Delivery delivery;
  CheckoutDeliveryUpdated(this.delivery);
}

final class CheckoutAddressUpdated extends CheckoutState {}
