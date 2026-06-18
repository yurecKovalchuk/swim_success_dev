import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:swim_success_dev/app/app_router/app_router.gr.dart';
import 'package:swim_success_dev/core/extensions/l10n_extension.dart';

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
          (
            icon: Icons.timer_outlined,
            selectedIcon: Icons.timer,
            label: context.l10n.navPace,
          ),
          (
            icon: Icons.people_outlined,
            selectedIcon: Icons.people,
            label: context.l10n.navUsers,
          ),
        ],
      ),
    );
  }
}

class _FloatingGlassNavBar extends StatefulWidget {
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
  State<_FloatingGlassNavBar> createState() => _FloatingGlassNavBarState();
}

class _FloatingGlassNavBarState extends State<_FloatingGlassNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnim;
  late Animation<double> _stretchAnim;

  int _fromIndex = 0;

  @override
  void initState() {
    super.initState();
    _fromIndex = widget.selectedIndex;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..value = 1.0;

    _positionAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubicEmphasized,
    );

    // pill stretches out then contracts back — drop effect
    _stretchAnim = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.5),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.5, end: 1.0),
        weight: 65,
      ),
    ]).animate(_controller);
  }

  @override
  void didUpdateWidget(_FloatingGlassNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _fromIndex = oldWidget.selectedIndex;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;
    const pillBaseWidth = 52.0;
    const pillHeight = 52.0;
    const itemVerticalPad = 12.0;

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
            padding: const EdgeInsets.symmetric(
              vertical: itemVerticalPad,
              horizontal: 8,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final n = widget.destinations.length;
                final tabWidth = constraints.maxWidth / n;

                double centerX(int index) => index * tabWidth + tabWidth / 2;

                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final fromX = centerX(_fromIndex);
                    final toX = centerX(widget.selectedIndex);
                    final currentX = lerpDouble(
                      fromX,
                      toX,
                      _positionAnim.value,
                    )!;
                    final currentWidth = pillBaseWidth * _stretchAnim.value;

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // sliding drop pill
                        Positioned(
                          left: currentX - currentWidth / 2,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              width: currentWidth,
                              height: pillHeight,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(40),
                                borderRadius:
                                    BorderRadius.circular(pillHeight / 2),
                              ),
                            ),
                          ),
                        ),
                        // tab items
                        Row(
                          children: List.generate(n, (index) {
                            final dest = widget.destinations[index];
                            final isSelected = index == widget.selectedIndex;
                            final color = isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurface.withAlpha(140);

                            return Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    widget.onDestinationSelected(index),
                                behavior: HitTestBehavior.opaque,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      child: Icon(
                                        isSelected
                                            ? dest.selectedIcon
                                            : dest.icon,
                                        key: ValueKey(isSelected),
                                        color: color,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    AnimatedDefaultTextStyle(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      style: TextStyle(
                                        color: color,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                      child: Text(dest.label),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
