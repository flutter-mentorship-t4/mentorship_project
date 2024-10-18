import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/networking/dio_factory.dart';
import '../../features/cart/data/repos/cart_repo.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../../features/categories/data/apis/categories_api_service.dart';
import '../../features/categories/data/repos/categories_repo.dart';
import '../../features/categories/logic/categories_cubit/categories_cubit.dart';
import '../../features/categories/logic/products_cubit/products_cubit.dart';
import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/products_repo.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/login/data/apis/log_in_services.dart';
import '../../features/login/data/repos/login_repository.dart';
import '../../features/signup/data/apis/sign_up_services.dart';
import '../../features/signup/data/repos/sign_up_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  // getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));

  getIt.registerLazySingleton<CartRepo>(() => CartRepo());

  getIt.registerLazySingleton<CategoriesApiService>(() => CategoriesApiService(dio));
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));

  getIt.registerFactory<SignUpService>(() => SignUpService());
  getIt.registerFactory<SignupRepo>(() => SignupRepo(getIt()));

  //login
  getIt.registerFactory<LogInServices>(() => LogInServices());
  getIt.registerFactory<LoginRepository>(() => LoginRepository(getIt()));

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt(), getIt())..getProducts());
  getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt())..loadCart());
  getIt.registerLazySingleton<CategoriesCubit>(() => CategoriesCubit(getIt()));
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));
}
