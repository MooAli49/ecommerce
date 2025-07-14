import 'package:ecommerce/core/service/database/cart_database_helper.dart';
import 'package:ecommerce/feature/cart/data/model/cart_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> addProductToCart(CartProductModel product) async {
    final dbHelper = CartDatabaseHelper();
    emit(CartLoading());
    try {
      await dbHelper.insertCartProduct(product);
      emit(CartProductAdded(product));
    } catch (e) {
      emit(CartError('Failed to add product to cart'));
    }
  }
}
