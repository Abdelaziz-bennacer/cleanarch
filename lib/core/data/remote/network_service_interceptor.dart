import 'package:cleanarch/core/data/local/secure_storage/isecure_storage.dart';
import 'package:cleanarch/core/data/local/secure_storage/secure_storage.dart';
import 'package:cleanarch/core/data/local/secure_storage/secure_storage_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider = Provider<NetworkServiceInterceptor>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return NetworkServiceInterceptor(secureStorage);
});

final class NetworkServiceInterceptor extends Interceptor {
  final ISecureStorage _secureStorage;

  NetworkServiceInterceptor(this._secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _secureStorage.readSecureData(accessTokenKey);
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }
}