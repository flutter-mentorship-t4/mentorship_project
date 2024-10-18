import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship_project/features/cart/data/repos/cart_repo.dart';
import 'package:mentorship_project/features/cart/logic/cart_cubit.dart';
import 'package:mentorship_project/features/home/logic/home_cubit.dart';
import 'package:mentorship_project/features/login/data/apis/log_in_services.dart';
import 'package:mentorship_project/features/signup/data/apis/sign_up_services.dart';
import 'package:mentorship_project/features/signup/data/repos/sign_up_repo.dart';
import 'package:mentorship_project/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_cubit.dart';

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
//wishlist
  getIt.registerLazySingleton<WishlistRepo>(() => WishlistRepo());
  getIt.registerLazySingleton<WishlistCubit>(
      () => WishlistCubit(getIt())..emitWishlist());

  // Cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo());

  getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt())..loadCart());

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt(), getIt(), getIt(), getIt())
      ..getProducts()
      ..getCategories(),
  );
}
