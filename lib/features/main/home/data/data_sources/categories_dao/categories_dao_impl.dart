import 'package:dartz/dartz.dart';


import 'package:injectable/injectable.dart';

import '../../../../../../core/remote/api_manager.dart';
import '../../../../../../core/remote/endpoints.dart';
import '../../models/categories_response/CategoriesResponse.dart';
import 'categories_dao.dart';
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