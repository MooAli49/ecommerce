part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

// Categories
final class CategoriesLoading extends HomeState {}

final class CategoriesLoaded extends HomeState {
  final List<CategoryModel> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends HomeState {
  final String message;

  CategoriesError(this.message);
}
