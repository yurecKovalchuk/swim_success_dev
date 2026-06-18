import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swim_success_dev/app/app_router/app_router.gr.dart';
import 'package:swim_success_dev/core/extensions/l10n_extension.dart';

@RoutePage()
class AppShellScreen extends StatelessWidget {
  const AppShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        PaceSelectorRoute(),
        UsersListRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => NavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.timer_outlined),
            selectedIcon: const Icon(Icons.timer),
            label: context.l10n.navPace,
          ),
          NavigationDestination(
            icon: const Icon(Icons.people_outlined),
            selectedIcon: const Icon(Icons.people),
            label: context.l10n.navUsers,
          ),
        ],
      ),
    );
  }
}
