import 'package:swim_success_dev/domain/models/user.dart';

enum UsersStatus { initial, loading, success, failure }

class UsersState {
  final List<User> users;
  final UsersStatus status;
  final String? errorMessage;
  final String searchQuery;

  const UsersState({
    this.users = const [],
    this.status = UsersStatus.initial,
    this.errorMessage,
    this.searchQuery = '',
  });

  List<User> get filteredUsers {
    if (searchQuery.isEmpty) return users;
    final q = searchQuery.toLowerCase();
    return users
        .where((u) =>
            u.name.toLowerCase().contains(q) ||
            u.email.toLowerCase().contains(q))
        .toList();
  }

  UsersState copyWith({
    List<User>? users,
    UsersStatus? status,
    String? errorMessage,
    String? searchQuery,
  }) {
    return UsersState(
      users: users ?? this.users,
      status: status ?? this.status,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
