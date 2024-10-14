import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship_project/features/cart/data/repos/cart_repo.dart';
import 'package:mentorship_project/features/login/data/apis/log_in_services.dart';
import 'package:mentorship_project/features/signup/data/apis/sign_up_services.dart';
import 'package:mentorship_project/features/signup/data/repos/sign_up_repo.dart';

import '../../core/networking/dio_factory.dart';
import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/categories_repo.dart';
import '../../features/home/data/repos/products_repo.dart';
import '../../features/login/data/repos/login_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));

  getIt.registerFactory<SignUpService>(() => SignUpService());
  getIt.registerFactory<SignupRepo>(() => SignupRepo(getIt()));

  //login
  getIt.registerFactory<LogInServices>(() => LogInServices());
  getIt.registerFactory<LoginRepository>(() => LoginRepository(getIt()));

  // Cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo());
}
