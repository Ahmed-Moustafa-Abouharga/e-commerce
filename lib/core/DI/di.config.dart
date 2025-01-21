// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/signin/data/data_sources/signin_api_dao_impl.dart'
    as _i1023;
import '../../features/auth/signin/data/data_sources/signin_dao.dart' as _i131;
import '../../features/auth/signin/data/repositories/signin_api_repo_impl.dart'
    as _i496;
import '../../features/auth/signin/domain/repositories/signin_repo.dart'
    as _i452;
import '../../features/auth/signin/domain/use_cases/signin_use_case.dart'
    as _i620;
import '../../features/auth/signin/presentation/manager/signin_view_model_cubit.dart'
    as _i309;
import '../../features/auth/signup/data/data_sources/signup_dao.dart' as _i498;
import '../../features/auth/signup/data/data_sources/signup_dao_api_impl.dart'
    as _i397;
import '../../features/auth/signup/data/repositories/SignupRepoImpl.dart'
    as _i246;
import '../../features/auth/signup/domain/repositories/signup_repo.dart'
    as _i297;
import '../../features/auth/signup/domain/use_cases/signup_use_case.dart'
    as _i410;
import '../../features/auth/signup/presentation/manager/signup_view_model_cubit.dart'
    as _i903;
import '../../features/main/home/data/data_sources/categories_dao/categories_dao.dart'
    as _i527;
import '../../features/main/home/data/data_sources/categories_dao/categories_dao_impl.dart'
    as _i795;
import '../../features/main/home/data/repositories/categories_repo_impl/categories_repo_impl.dart'
    as _i674;
import '../../features/main/home/domain/repositories/categories_repo/categories_repo.dart'
    as _i649;
import '../../features/main/home/domain/use_cases/categories_use_case/categoreies_use_case.dart'
    as _i909;
import '../../features/main/home/presentation/manager/category/category_cubit.dart'
    as _i416;
import '../remote/api_manager.dart' as _i822;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i822.ApiManager>(() => _i822.ApiManager());
    gh.factory<_i527.CategoriesDao>(
        () => _i795.CategoriesDaoImpl(gh<_i822.ApiManager>()));
    gh.factory<_i498.SignupDao>(
        () => _i397.SignupDaoApiImpl(gh<_i822.ApiManager>()));
    gh.factory<_i131.SigninDao>(
        () => _i1023.SigninApiDaoImpl(gh<_i822.ApiManager>()));
    gh.factory<_i297.SignupRepo>(
        () => _i246.SignupRepoImpl(gh<_i498.SignupDao>()));
    gh.factory<_i410.SignupUseCase>(
        () => _i410.SignupUseCase(gh<_i297.SignupRepo>()));
    gh.factory<_i452.SigninRepo>(
        () => _i496.SigninApiRepoImpl(gh<_i131.SigninDao>()));
    gh.factory<_i649.CategoriesRepo>(
        () => _i674.CategoriesRepoImpl(gh<_i527.CategoriesDao>()));
    gh.factory<_i903.SignupViewModelCubit>(
        () => _i903.SignupViewModelCubit(gh<_i410.SignupUseCase>()));
    gh.factory<_i620.SigninUseCase>(
        () => _i620.SigninUseCase(gh<_i452.SigninRepo>()));
    gh.factory<_i909.CategoriesUseCase>(
        () => _i909.CategoriesUseCase(gh<_i649.CategoriesRepo>()));
    gh.factory<_i416.CategoryCubit>(
        () => _i416.CategoryCubit(gh<_i909.CategoriesUseCase>()));
    gh.factory<_i309.SigninViewModelCubit>(
        () => _i309.SigninViewModelCubit(gh<_i620.SigninUseCase>()));
    return this;
  }
}
