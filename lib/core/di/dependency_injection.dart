import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship_project/features/signup/data/apis/sign_up_services.dart';
import 'package:mentorship_project/features/signup/data/repos/sign_up_repo.dart';

import '../../core/networking/dio_factory.dart';
import '../../features/login/data/apis/login_api_service.dart';
import '../../features/login/data/repos/login_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  // Login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // SignUp
  // getIt.registerLazySingleton<SignupApiService>(() => SignupApiService(dio));
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpService>(()=>SignUpService());
  getIt.registerFactory<SignupRepo>(() => SignupRepo(getIt()));
}
