import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Swim Success'**
  String get appTitle;

  /// No description provided for @navPace.
  ///
  /// In en, this message translates to:
  /// **'Pace'**
  String get navPace;

  /// No description provided for @navUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get navUsers;

  /// No description provided for @paceSelectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Pace Selector'**
  String get paceSelectorTitle;

  /// No description provided for @paceTargetPace.
  ///
  /// In en, this message translates to:
  /// **'Target Pace'**
  String get paceTargetPace;

  /// No description provided for @pacePer100m.
  ///
  /// In en, this message translates to:
  /// **'per 100m'**
  String get pacePer100m;

  /// No description provided for @paceSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Pace'**
  String get paceSectionLabel;

  /// No description provided for @paceDetectedLevel.
  ///
  /// In en, this message translates to:
  /// **'Detected Level'**
  String get paceDetectedLevel;

  /// No description provided for @paceContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get paceContinue;

  /// No description provided for @paceReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get paceReset;

  /// No description provided for @paceSubmitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Pace submitted successfully!'**
  String get paceSubmitSuccess;

  /// No description provided for @paceSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get paceSuccessTitle;

  /// No description provided for @paceErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get paceErrorTitle;

  /// No description provided for @dialogOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get dialogOk;

  /// No description provided for @levelBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get levelBeginner;

  /// No description provided for @levelIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get levelIntermediate;

  /// No description provided for @levelAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get levelAdvanced;

  /// No description provided for @levelElite.
  ///
  /// In en, this message translates to:
  /// **'Elite'**
  String get levelElite;

  /// No description provided for @levelBeginnerDesc.
  ///
  /// In en, this message translates to:
  /// **'Pace > 2:30 / 100m'**
  String get levelBeginnerDesc;

  /// No description provided for @levelIntermediateDesc.
  ///
  /// In en, this message translates to:
  /// **'Pace 2:00 – 2:30 / 100m'**
  String get levelIntermediateDesc;

  /// No description provided for @levelAdvancedDesc.
  ///
  /// In en, this message translates to:
  /// **'Pace 1:30 – 2:00 / 100m'**
  String get levelAdvancedDesc;

  /// No description provided for @levelEliteDesc.
  ///
  /// In en, this message translates to:
  /// **'Pace < 1:30 / 100m'**
  String get levelEliteDesc;

  /// No description provided for @usersTitle.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get usersTitle;

  /// No description provided for @usersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or email…'**
  String get usersSearchHint;

  /// No description provided for @usersEmpty.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get usersEmpty;

  /// No description provided for @usersErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load users'**
  String get usersErrorTitle;

  /// No description provided for @usersRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get usersRetry;

  /// No description provided for @detailContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get detailContact;

  /// No description provided for @detailAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get detailAddress;

  /// No description provided for @detailCompany.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get detailCompany;

  /// No description provided for @detailEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get detailEmail;

  /// No description provided for @detailPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get detailPhone;

  /// No description provided for @detailWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get detailWebsite;

  /// No description provided for @detailCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get detailCity;

  /// No description provided for @detailCompanyName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get detailCompanyName;

  /// No description provided for @detailCatchPhrase.
  ///
  /// In en, this message translates to:
  /// **'Catch phrase'**
  String get detailCatchPhrase;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
