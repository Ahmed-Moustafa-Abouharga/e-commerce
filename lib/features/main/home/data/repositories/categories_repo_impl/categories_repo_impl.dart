import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/remote/internet_checker.dart';
import 'package:e_commerce/features/main/home/data/data_sources/categories_dao/categories_dao.dart';
import 'package:e_commerce/features/main/home/domain/entities/categories_entity/CategoriesEntity.dart';
import 'package:e_commerce/features/main/home/domain/repositories/categories_repo/categories_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoriesRepo)
class CategoriesRepoImpl extends CategoriesRepo{
  CategoriesDao categoreisDao;
  @factoryMethod
  CategoriesRepoImpl(this.categoreisDao);
  @override
  Future<Either<CategoriesEntity, String>> getAllCategories()async {
    bool isConnected = await InternetChecker.checkNetwork();
if(isConnected)
  {
    var result=  await categoreisDao.getAllCategories();
    return result.fold((response) {
      return Left(response.toCategoriesEntity()) ;
    }, (error) {
      return Right(error) ;
    },) ;
  }
else{
  return Right("NO internet connection") ;
}
  }

}