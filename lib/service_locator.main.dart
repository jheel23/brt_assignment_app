part of 'service_locator.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  final secureStorage = FlutterSecureStorage();
  final secureStorageService = SecureStorageService(secureStorage);
  sl.registerLazySingleton(() => secureStorageService);
  sl.registerLazySingleton(() => Dio());

  //Dio client initialization...
  sl.registerLazySingleton(() => DioClient(ApiEndpoints.baseUrl, sl<Dio>()));

  // ----------------------------------------------------------------------
  //? Services/Sources
  // ----------------------------------------------------------------------
  sl.registerLazySingleton<ProductApiService>(
    () => ProductApiServiceImpl(sl()),
  );

  // ----------------------------------------------------------------------
  //? Repositories
  // ----------------------------------------------------------------------
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(
      productApiService: sl<ProductApiService>(),
      storageService: sl<SecureStorageService>(),
    ),
  );

  // ----------------------------------------------------------------------
  //? Providers
  // ----------------------------------------------------------------------

  sl.registerLazySingleton<ProductsNotifier>(() => ProductsNotifier());
}
