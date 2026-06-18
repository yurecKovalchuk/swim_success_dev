import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static String get usersBaseUrl => dotenv.env['USERS_BASE_URL']!;
  static String get paceBaseUrl => dotenv.env['PACE_BASE_URL']!;

  static const String users = '/users';
  static const String posts = '/posts';
}
