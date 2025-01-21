

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/features/main/home/domain/entities/categories_entity/CategoriesEntity.dart';

abstract class CategoriesRepo
{
  Future<Either<CategoriesEntity,String>> getAllCategories() ;
}