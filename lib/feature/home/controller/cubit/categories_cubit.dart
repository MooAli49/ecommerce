import 'package:ecommerce/feature/home/data/models/category_model.dart';
import 'package:ecommerce/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  final HomeRepo _homeRepo = HomeRepo();

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final categories = await _homeRepo.getCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
