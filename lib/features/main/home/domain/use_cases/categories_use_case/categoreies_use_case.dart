import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../entities/categories_entity/CategoriesEntity.dart';
import '../../repositories/categories_repo/categories_repo.dart';
@injectable
class CategoriesUseCase{

  CategoriesRepo categoriesRepo ;
  @factoryMethod
  CategoriesUseCase(this.categoriesRepo) ;
Future<Either<CategoriesEntity,String>>  call()=>categoriesRepo.getAllCategories();
}