import 'package:flutter/widgets.dart';
import 'package:swim_success_dev/l10n/app_localizations.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
