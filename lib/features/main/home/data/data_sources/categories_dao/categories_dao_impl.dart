import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/remote/api_manager.dart';
import 'package:e_commerce/core/remote/endpoints.dart';
import 'package:e_commerce/features/main/home/data/data_sources/categories_dao/categories_dao.dart';

import 'package:injectable/injectable.dart';

import '../../models/categories_response/CategoriesResponse.dart';
@Injectable(as:CategoriesDao )
class CategoriesDaoImpl extends CategoriesDao{
  ApiManager apiManager;
  @factoryMethod
  CategoriesDaoImpl(this.apiManager) ;
  @override
  Future<Either<CategoriesResponse,String>> getAllCategories()async {
    try{
      var response = await apiManager.getRequest(
        Endpoints.allCategoriesEndPoint,);
      var result = CategoriesResponse.fromJson(response.data);
      return Left(result);
    }
    catch(error){
return Right(error.toString());
    }
  }
  
}