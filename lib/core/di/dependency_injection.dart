import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/login/data/apis/login_api_service.dart';
import '../../features/login/data/repos/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
    
  // Login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    
  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
