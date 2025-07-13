import '../../data/models/product_model.dart';
import '../../data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final HomeRepo _homeRepo = HomeRepo();

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _homeRepo.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
