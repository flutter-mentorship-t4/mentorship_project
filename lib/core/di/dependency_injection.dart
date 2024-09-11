import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship_project/core/networking/api_service.dart';
import 'package:mentorship_project/core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
