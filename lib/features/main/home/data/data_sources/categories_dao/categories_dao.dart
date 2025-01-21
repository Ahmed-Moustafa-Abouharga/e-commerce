

import 'package:dartz/dartz.dart';

import '../../models/categories_response/CategoriesResponse.dart';

abstract class CategoriesDao {
  Future<Either<CategoriesResponse,String>> getAllCategories();
}
