part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartProductAdded extends CartState {
  final CartProductModel product;

  CartProductAdded(this.product);
}

final class CartProductRemoved extends CartState {
  final CartProductModel product;

  CartProductRemoved(this.product);
}

final class CartProductUpdated extends CartState {
  final CartProductModel product;

  CartProductUpdated(this.product);
}

final class CartError extends CartState {
  final String message;

  CartError(this.message);
}

final class CartLoaded extends CartState {
  final List<CartProductModel> products;

  CartLoaded(this.products);
}
