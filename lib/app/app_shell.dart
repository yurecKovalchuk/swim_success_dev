import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swim_success_dev/app/app_router/app_router.gr.dart';
import 'package:swim_success_dev/core/extensions/l10n_extension.dart';

// Height of the floating navbar itself (excluding system bottom inset)
const double kFloatingNavBarHeight = 80.0;

@RoutePage()
class AppShellScreen extends StatelessWidget {
  const AppShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: const [
        PaceSelectorRoute(),
        UsersListRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => _FloatingGlassNavBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        destinations: [
          (icon: Icons.timer_outlined, selectedIcon: Icons.timer,
            label: context.l10n.navPace),
          (icon: Icons.people_outlined, selectedIcon: Icons.people,
            label: context.l10n.navUsers),
        ],
      ),
    );
  }
}

class _FloatingGlassNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<({IconData icon, IconData selectedIcon, String label})>
      destinations;

  const _FloatingGlassNavBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, bottomInset + 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withAlpha(140),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: theme.colorScheme.outline.withAlpha(60),
                width: 0.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(destinations.length, (index) {
                final dest = destinations[index];
                final isSelected = index == selectedIndex;
                final color = isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withAlpha(140);

                return GestureDetector(
                  onTap: () => onDestinationSelected(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary.withAlpha(30)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            isSelected ? dest.selectedIcon : dest.icon,
                            key: ValueKey(isSelected),
                            color: color,
                            size: 22,
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: isSelected
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    dest.label,
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
