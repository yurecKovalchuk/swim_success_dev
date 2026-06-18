import 'package:swim_success_dev/domain/models/user.dart';

abstract class IUsersRepository {
  Future<List<User>> fetchUsers();
}
