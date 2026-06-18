import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success_dev/app/di/injector.dart';
import 'package:swim_success_dev/domain/repositories/i_users_repository.dart';
import 'package:swim_success_dev/features/users/bloc/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final IUsersRepository _repository;

  UsersCubit()
      : _repository = getIt<IUsersRepository>(),
        super(const UsersState()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    emit(state.copyWith(status: UsersStatus.loading, errorMessage: null));

    try {
      final users = await _repository.fetchUsers();
      emit(state.copyWith(users: users, status: UsersStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: UsersStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
