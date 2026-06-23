import 'package:get_it/get_it.dart';
import 'package:swim_success_dev/app/app_router/app_router.dart';
import 'package:swim_success_dev/data/repositories/pace_repository.dart';
import 'package:swim_success_dev/data/repositories/users_repository.dart';
import 'package:swim_success_dev/domain/repositories/i_pace_repository.dart';
import 'package:swim_success_dev/domain/repositories/i_users_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt
    ..registerLazySingleton<IPaceRepository>(PaceRepository.new)
    ..registerLazySingleton<IUsersRepository>(UsersRepository.new)
    ..registerSingleton<AppRouter>(AppRouter());
}
