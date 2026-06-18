import 'package:dio/dio.dart';
import 'package:swim_success_dev/core/constants/api_endpoints.dart';
import 'package:swim_success_dev/data/network/dio_client.dart';
import 'package:swim_success_dev/domain/models/user.dart';
import 'package:swim_success_dev/domain/repositories/i_users_repository.dart';

class UsersRepository implements IUsersRepository {
  final Dio _dio;

  UsersRepository()
      : _dio = DioClient.create(baseUrl: ApiEndpoints.usersBaseUrl);

  @override
  Future<List<User>> fetchUsers() async {
    final response = await _dio.get(ApiEndpoints.users);
    final data = response.data as List<dynamic>;
    return data
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
