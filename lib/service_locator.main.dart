part of 'service_locator.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  final secureStorage = FlutterSecureStorage();
  final secureStorageService = SecureStorageService(secureStorage);
  sl.registerLazySingleton(() => secureStorageService);
  sl.registerLazySingleton(() => Dio());

  //Dio client initialization...
  sl.registerLazySingleton(() => DioClient(ApiEndpoints.baseUrl, sl()));

  // ----------------------------------------------------------------------
  //? Services/Sources
  // ----------------------------------------------------------------------
  // sl.registerSingleton<DemandItemsApiService>(DemandItemsApiServiceImpl(sl()));

  // ----------------------------------------------------------------------
  //? Repositories
  // ----------------------------------------------------------------------
  // sl.registerSingleton<DemandItemsRepo>(DemandItemsRepoImp(sl()));

  // ----------------------------------------------------------------------
  //? Providers
  // ----------------------------------------------------------------------
  // sl.registerFactory(() => DemandItemsNotifier(sl<GetDemandItemsUseCase>()));
}
