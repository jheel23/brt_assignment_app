import 'package:brtassignment/data/repository/product_repo.dart';
import 'package:brtassignment/data/source/product_api_service.dart';
import 'package:brtassignment/core/local/secure_storage_service.dart';
import 'package:brtassignment/providers/products/products_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'core/constants/api_endpoints.dart';
import 'core/network/dio_client.dart';

part 'service_locator.main.dart';
