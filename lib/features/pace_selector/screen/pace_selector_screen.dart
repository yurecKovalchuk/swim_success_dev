import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: const Text('Pace Selector'),
        centerTitle: true,
      ),
      body: BlocConsumer<PaceSelectorCubit, PaceSelectorState>(
        listener: (context, state) {
          if (state.status == PaceSubmitStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Pace submitted successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          final sliderValue =
              state.paceSeconds.toDouble().clamp(_kSliderMin, _kSliderMax);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SectionCard(
                  title: 'Target Pace',
                  subtitle: 'per 100m',
                  child: MinSecInput(
                    minutes: state.minutes,
                    seconds: state.seconds,
                    onMinutesChanged: cubit.setMinutes,
                    onSecondsChanged: cubit.setSeconds,
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: 'Pace',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: _kTickLabels.entries
                              .map(
                                (e) => Text(
                                  e.value,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withAlpha(160),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: 'Detected Level',
                  child: Column(
                    children: [
                      SwimmerLevelBadge(level: state.swimmerLevel),
                      const SizedBox(height: 8),
                      Text(
                        state.swimmerLevel.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color:
                              theme.colorScheme.onSurface.withAlpha(150),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
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
                FilledButton(
                  onPressed: state.status == PaceSubmitStatus.loading
                      ? null
                      : cubit.submit,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: state.status == PaceSubmitStatus.loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Continue',
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),
                if (state.status == PaceSubmitStatus.success)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextButton(
                      onPressed: cubit.reset,
                      child: const Text('Reset'),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
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
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
