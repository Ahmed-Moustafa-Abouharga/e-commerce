import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/categories_entity/CategoriesEntity.dart';
import '../../../domain/use_cases/categories_use_case/categoreies_use_case.dart';

part 'category_state.dart';
 @injectable
class CategoryCubit extends Cubit<CategoryState> {
   @factoryMethod
  CategoryCubit(this.categoriesUseCase) : super(CategoryInitial());
  CategoriesUseCase categoriesUseCase ;

  getCategories()async
  {
    emit(CategoryLoading()) ;
   var result = await categoriesUseCase.call();
   result.fold((categoriesEnitity) {
     emit(CategorySuccess(categoriesEntity: categoriesEnitity)) ;
   }, (error) {
     emit(CategoryError(errorMsg: error)) ;
   },) ; 
  }

}
