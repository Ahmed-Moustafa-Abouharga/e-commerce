part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final CategoriesEntity categoriesEntity;

  CategorySuccess({required this.categoriesEntity});

}
final class CategoryError extends CategoryState {
  final String errorMsg;

  CategoryError({required this.errorMsg});
}
