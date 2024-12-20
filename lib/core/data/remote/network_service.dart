import 'package:cleanarch/core/data/remote/network_service_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );
  final dio = Dio(options);
  final networkServiceInterceptor = ref.watch(networkServiceInterceptorProvider);
  dio.interceptors.addAll([
    HttpFormatter(),
    networkServiceInterceptor,
  ]);
  return dio;
});