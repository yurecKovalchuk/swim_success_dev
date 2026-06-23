import 'package:auto_route/auto_route.dart';
import 'package:swim_success_dev/app/app_router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppShellRoute.page,
          initial: true,
          children: [
            AutoRoute(page: PaceSelectorRoute.page, initial: true),
            AutoRoute(page: UsersListRoute.page),
          ],
        ),
        AutoRoute(page: UserDetailRoute.page),
      ];
}
