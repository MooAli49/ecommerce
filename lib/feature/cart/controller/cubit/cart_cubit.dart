import 'dart:developer';

import 'package:ecommerce/core/service/database/cart_database_helper.dart';
import 'package:ecommerce/feature/cart/data/model/cart_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> fetchCartProducts() async {
    final dbHelper = CartDatabaseHelper();
    emit(CartLoading());
    try {
      final cartProducts = await dbHelper.getCartProducts();
      emit(CartLoaded(cartProducts));
    } catch (e) {
      emit(CartError('Failed to load cart products'));
    }
  }

  Future<void> addProductToCart(CartProductModel newCartProduct) async {
    emit(CartLoading());
    final dbHelper = CartDatabaseHelper();
    try {
      final exists = await dbHelper.isProductInCart(newCartProduct.productId);
      if (exists) {
        // Fetch current quantity
        final cartProducts = await dbHelper.getCartProducts();
        final existingProduct = cartProducts.firstWhere(
          (p) => p.productId == newCartProduct.productId,
        );
        final updatedQuantity =
            existingProduct.quantity + newCartProduct.quantity;
        await dbHelper.updateCartProductQuantity(
          newCartProduct.productId,
          updatedQuantity,
        );
        emit(CartProductUpdated(existingProduct..quantity = updatedQuantity));
        await fetchCartProducts();
        return;
      }
      await dbHelper.insertCartProduct(newCartProduct);
      emit(CartProductAdded(newCartProduct));
      await fetchCartProducts();
    } catch (e) {
      log('Error adding product to cart: $e');
      emit(CartError('Failed to add product to cart'));
    }
  }

  Future<void> removeProductFromCart(String productId) async {
    final dbHelper = CartDatabaseHelper();
    emit(CartLoading());
    try {
      await dbHelper.deleteCartProduct(productId);
      emit(
        CartProductRemoved(
          CartProductModel(
            productId: productId,
            name: '',
            imageUrl: '',
            quantity: 0,
            price: 0,
          ),
        ),
      );
      await fetchCartProducts();
    } catch (e) {
      emit(CartError('Failed to remove product from cart'));
    }
  }

  Future<void> increaseProductQuantity(String productId) async {
    final dbHelper = CartDatabaseHelper();
    emit(CartLoading());
    try {
      final cartProducts = await dbHelper.getCartProducts();
      final product = cartProducts.firstWhere((p) => p.productId == productId);
      final updatedQuantity = product.quantity + 1;
      await dbHelper.updateCartProductQuantity(productId, updatedQuantity);
      emit(CartProductUpdated(product..quantity = updatedQuantity));
      await fetchCartProducts();
    } catch (e) {
      emit(CartError('Failed to increase product quantity'));
    }
  }

  Future<void> decreaseProductQuantity(String productId) async {
    final dbHelper = CartDatabaseHelper();
    emit(CartLoading());
    try {
      final cartProducts = await dbHelper.getCartProducts();
      final product = cartProducts.firstWhere((p) => p.productId == productId);
      if (product.quantity > 1) {
        final updatedQuantity = product.quantity - 1;
        await dbHelper.updateCartProductQuantity(productId, updatedQuantity);
        emit(CartProductUpdated(product..quantity = updatedQuantity));
      } else {
        await dbHelper.deleteCartProduct(productId);
        emit(CartProductRemoved(product));
      }
      await fetchCartProducts();
    } catch (e) {
      emit(CartError('Failed to decrease product quantity'));
    }
  }
}
