import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship_project/features/login/data/apis/log_in_services.dart';
import 'package:mentorship_project/features/login/data/repos/log_in_repo.dart';
import 'package:mentorship_project/features/signup/data/repos/sign_up_repo.dart';
import 'package:mentorship_project/features/signup/ui/signup_screen.dart';

import '../../core/networking/dio_factory.dart';
import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/home_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  // Login
  getIt.registerLazySingleton<LogInServices>(() => LogInServices());
  getIt.registerLazySingleton<LogInRepo>(() => LogInRepo(getIt()));
  // SignUp
  getIt.registerLazySingleton<SignUpScreen>(() => SignUpScreen());
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
