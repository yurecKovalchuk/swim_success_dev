import 'package:dio/dio.dart';
import 'package:swim_success_dev/core/constants/api_endpoints.dart';
import 'package:swim_success_dev/core/network/network_exception.dart';
import 'package:swim_success_dev/data/network/dio_client.dart';
import 'package:swim_success_dev/domain/models/pace_request.dart';
import 'package:swim_success_dev/domain/repositories/i_pace_repository.dart';

class PaceRepository implements IPaceRepository {
  final Dio _dio;

  PaceRepository() : _dio = DioClient.create(baseUrl: ApiEndpoints.baseUrl);

  @override
  Future<void> submitPace(PaceRequest request) async {
    try {
      await _dio.post(ApiEndpoints.posts, data: request.toJson());
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
