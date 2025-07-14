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

  Future<void> addProductToCart(CartProductModel product) async {
    emit(CartLoading());
    final dbHelper = CartDatabaseHelper();
    try {
      await dbHelper.insertCartProduct(product);
      emit(CartProductAdded(product));
    } catch (e) {
      log('Error adding product to cart: $e');
      emit(CartError('Failed to add product to cart'));
    }
  }

  // Future<void> removeProductFromCart(int productId) async {
  //   final dbHelper = CartDatabaseHelper();
  //   emit(CartLoading());
  //   try {
  //     await dbHelper.deleteCartProduct(productId);
  //     emit(CartProductRemoved(productId));
  //   } catch (e) {
  //     emit(CartError('Failed to remove product from cart'));
  //   }
  // }
}
