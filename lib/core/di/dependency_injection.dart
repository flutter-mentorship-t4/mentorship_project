import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship_project/features/login/data/apis/log_in_services.dart';
import 'package:mentorship_project/features/login/data/repos/log_in_repo.dart';
import 'package:mentorship_project/features/signup/data/apis/sign_up_services.dart';
import 'package:mentorship_project/features/signup/data/repos/sign_up_repo.dart';

import '../../core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  // SignUp

  getIt.registerFactory<SignUpService>(() => SignUpService());
  getIt.registerFactory<SignupRepo>(() => SignupRepo(getIt()));
  //login
  getIt.registerFactory<LogInServices>(() => LogInServices());
  getIt.registerFactory<LogInRepo>(() => LogInRepo(getIt()));
}
