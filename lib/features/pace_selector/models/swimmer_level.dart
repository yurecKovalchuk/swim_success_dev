import 'package:swim_success_dev/l10n/app_localizations.dart';

enum SwimmerLevel {
  beginner,
  intermediate,
  advanced,
  elite;

  String localizedLabel(AppLocalizations l10n) {
    switch (this) {
      case SwimmerLevel.beginner:
        return l10n.levelBeginner;
      case SwimmerLevel.intermediate:
        return l10n.levelIntermediate;
      case SwimmerLevel.advanced:
        return l10n.levelAdvanced;
      case SwimmerLevel.elite:
        return l10n.levelElite;
    }
  }

  String localizedDescription(AppLocalizations l10n) {
    switch (this) {
      case SwimmerLevel.beginner:
        return l10n.levelBeginnerDesc;
      case SwimmerLevel.intermediate:
        return l10n.levelIntermediateDesc;
      case SwimmerLevel.advanced:
        return l10n.levelAdvancedDesc;
      case SwimmerLevel.elite:
        return l10n.levelEliteDesc;
    }
  }

  static SwimmerLevel fromPace({required int minutes, required int seconds}) {
    final totalSeconds = minutes * 60 + seconds;
    if (totalSeconds < 90) return SwimmerLevel.elite;
    if (totalSeconds < 120) return SwimmerLevel.advanced;
    if (totalSeconds < 150) return SwimmerLevel.intermediate;
    return SwimmerLevel.beginner;
  }
}
