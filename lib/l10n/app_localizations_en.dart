// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Swim Success';

  @override
  String get navPace => 'Pace';

  @override
  String get navUsers => 'Users';

  @override
  String get paceSelectorTitle => 'Pace Selector';

  @override
  String get paceTargetPace => 'Target Pace';

  @override
  String get pacePer100m => 'per 100m';

  @override
  String get paceSectionLabel => 'Pace';

  @override
  String get paceDetectedLevel => 'Detected Level';

  @override
  String get paceContinue => 'Continue';

  @override
  String get paceReset => 'Reset';

  @override
  String get paceSubmitSuccess => 'Pace submitted successfully!';

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelIntermediate => 'Intermediate';

  @override
  String get levelAdvanced => 'Advanced';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelBeginnerDesc => 'Pace > 2:30 / 100m';

  @override
  String get levelIntermediateDesc => 'Pace 2:00 – 2:30 / 100m';

  @override
  String get levelAdvancedDesc => 'Pace 1:30 – 2:00 / 100m';

  @override
  String get levelEliteDesc => 'Pace < 1:30 / 100m';

  @override
  String get usersTitle => 'Users';

  @override
  String get usersSearchHint => 'Search by name or email…';

  @override
  String get usersEmpty => 'No users found';

  @override
  String get usersErrorTitle => 'Failed to load users';

  @override
  String get usersRetry => 'Retry';

  @override
  String get detailContact => 'Contact';

  @override
  String get detailAddress => 'Address';

  @override
  String get detailCompany => 'Company';

  @override
  String get detailEmail => 'Email';

  @override
  String get detailPhone => 'Phone';

  @override
  String get detailWebsite => 'Website';

  @override
  String get detailCity => 'City';

  @override
  String get detailCompanyName => 'Name';

  @override
  String get detailCatchPhrase => 'Catch phrase';
}
