import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swim_success_dev/app/app_shell.dart';
import 'package:swim_success_dev/core/extensions/l10n_extension.dart';
import 'package:swim_success_dev/features/pace_selector/bloc/pace_selector_cubit.dart';
import 'package:swim_success_dev/features/pace_selector/bloc/pace_selector_state.dart';
import 'package:swim_success_dev/features/pace_selector/widgets/min_sec_input.dart';
import 'package:swim_success_dev/features/pace_selector/widgets/swimmer_level_badge.dart';

// Slider range: 1:00 (60s) – 3:00 (180s)
const double _kSliderMin = 60;
const double _kSliderMax = 180;

// Tick labels shown below slider
const _kTickLabels = {70: '1:10', 90: '1:30', 120: '2:00', 150: '2:30'};

@RoutePage()
class PaceSelectorScreen extends StatelessWidget {
  const PaceSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaceSelectorCubit(),
      child: const _PaceSelectorView(),
    );
  }
}

class _PaceSelectorView extends StatelessWidget {
  const _PaceSelectorView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaceSelectorCubit>();
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<PaceSelectorCubit, PaceSelectorState>(
        listener: (context, state) {
          if (state.status == PaceSubmitStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.paceSubmitSuccess),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          final l10n = context.l10n;
          final sliderValue =
              state.paceSeconds.toDouble().clamp(_kSliderMin, _kSliderMax);

          final insets = MediaQuery.of(context).padding;
          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              16, insets.top + 12, 16, insets.bottom + kFloatingNavBarHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SectionCard(
                  title: l10n.paceTargetPace,
                  subtitle: l10n.pacePer100m,
                  child: Center(
                    child: MinSecInput(
                      minutes: state.minutes,
                      seconds: state.seconds,
                      onMinutesChanged: cubit.setMinutes,
                      onSecondsChanged: cubit.setSeconds,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                _SectionCard(
                  title: l10n.paceSectionLabel,
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 10,
                          ),
                        ),
                        child: Slider(
                          value: sliderValue,
                          min: _kSliderMin,
                          max: _kSliderMax,
                          onChanged: cubit.setPaceFromSlider,
                        ),
                      ),
                      _SliderTickLabels(
                        tickLabels: _kTickLabels,
                        sliderMin: _kSliderMin,
                        sliderMax: _kSliderMax,
                        thumbRadius: 10,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withAlpha(160),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                _SectionCard(
                  title: l10n.paceDetectedLevel,
                  child: Column(
                    children: [
                      SwimmerLevelBadge(
                        level: state.swimmerLevel,
                        label: state.swimmerLevel.localizedLabel(l10n),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.swimmerLevel.localizedDescription(l10n),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withAlpha(150),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (state.status == PaceSubmitStatus.failure &&
                    state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.errorMessage!,
                      style: TextStyle(color: theme.colorScheme.error),
                      textAlign: TextAlign.center,
                    ),
                  ),
                _AquaGlassButton(
                  onPressed: state.status == PaceSubmitStatus.loading
                      ? null
                      : cubit.submit,
                  isLoading: state.status == PaceSubmitStatus.loading,
                  label: l10n.paceContinue,
                ),
                if (state.status == PaceSubmitStatus.success)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextButton(
                      onPressed: cubit.reset,
                      child: Text(l10n.paceReset),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AquaGlassButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;

  const _AquaGlassButton({
    required this.onPressed,
    required this.isLoading,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null && !isLoading;
    final borderOpacity = disabled ? 0.15 : 0.65;
    final bgOpacity = disabled ? 0.04 : 0.10;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: [
            Colors.cyanAccent.withOpacity(borderOpacity),
            Colors.blue.shade300.withOpacity(borderOpacity * 0.7),
            Colors.cyan.shade700.withOpacity(borderOpacity * 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(1.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan.withOpacity(bgOpacity),
                  Colors.blue.shade900.withOpacity(bgOpacity * 1.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                splashColor: Colors.cyanAccent.withOpacity(0.12),
                highlightColor: Colors.cyan.withOpacity(0.08),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.cyanAccent.withOpacity(0.8),
                            ),
                          )
                        : Text(
                            label,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: disabled
                                  ? Colors.cyan.withOpacity(0.35)
                                  : Colors.cyanAccent.shade100,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withAlpha(150),
                ),
              ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}

class _SliderTickLabels extends StatelessWidget {
  final Map<int, String> tickLabels;
  final double sliderMin;
  final double sliderMax;
  final double thumbRadius;
  final TextStyle? style;

  const _SliderTickLabels({
    required this.tickLabels,
    required this.sliderMin,
    required this.sliderMax,
    required this.thumbRadius,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final range = sliderMax - sliderMin;

        return SizedBox(
          height: 20,
          child: Stack(
            children: tickLabels.entries.map((entry) {
              final frac = (entry.key - sliderMin) / range;
              // account for thumb padding so label aligns with thumb position
              final xFrac = (thumbRadius + frac * (w - 2 * thumbRadius)) / w;
              return Align(
                alignment: Alignment(xFrac * 2 - 1, 0),
                child: Text(entry.value, style: style),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
