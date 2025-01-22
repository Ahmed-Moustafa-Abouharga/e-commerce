

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../entities/categories_entity/CategoriesEntity.dart';

abstract class CategoriesRepo
{
  Future<Either<CategoriesEntity,String>> getAllCategories() ;
}