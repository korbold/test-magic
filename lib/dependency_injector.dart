import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_r/app/data/repositories_impl/gathering_repository_impl.dart';
import 'package:test_r/app/data/sources/gathering_source.dart';
import 'package:test_r/app/domain/repositories/gathering_respository.dart';
import 'package:test_r/app/domain/usecases/get_list.dart';
import 'package:test_r/enviroments/enviroment.dart';

final locator = GetIt.instance;

void injectDependencies() {
  final String baseUrl = Enviroment().config.baseUrl;
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 500000),
    receiveTimeout: const Duration(milliseconds: 300000),
  ));

  locator.registerLazySingleton(() => dio);

  locator.registerLazySingleton(() => GetList(repository: locator()));
  locator.registerLazySingleton<GatheringRepository>(() => GatheringRepositoryImpl(gatheringSource: locator()));
  locator.registerLazySingleton(() => GatheringSource());
}
