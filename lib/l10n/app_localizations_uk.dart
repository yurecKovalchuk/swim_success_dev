// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Swim Success';

  @override
  String get navPace => 'Темп';

  @override
  String get navUsers => 'Користувачі';

  @override
  String get paceSelectorTitle => 'Вибір темпу';

  @override
  String get paceTargetPace => 'Цільовий темп';

  @override
  String get pacePer100m => 'на 100м';

  @override
  String get paceSectionLabel => 'Темп';

  @override
  String get paceDetectedLevel => 'Рівень плавця';

  @override
  String get paceContinue => 'Продовжити';

  @override
  String get paceReset => 'Скинути';

  @override
  String get paceSubmitSuccess => 'Темп успішно надіслано!';

  @override
  String get levelBeginner => 'Початківець';

  @override
  String get levelIntermediate => 'Середній';

  @override
  String get levelAdvanced => 'Просунутий';

  @override
  String get levelElite => 'Еліта';

  @override
  String get levelBeginnerDesc => 'Темп > 2:30 / 100м';

  @override
  String get levelIntermediateDesc => 'Темп 2:00 – 2:30 / 100м';

  @override
  String get levelAdvancedDesc => 'Темп 1:30 – 2:00 / 100м';

  @override
  String get levelEliteDesc => 'Темп < 1:30 / 100м';

  @override
  String get usersTitle => 'Користувачі';

  @override
  String get usersSearchHint => 'Пошук за іменем або email…';

  @override
  String get usersEmpty => 'Користувачів не знайдено';

  @override
  String get usersErrorTitle => 'Не вдалося завантажити користувачів';

  @override
  String get usersRetry => 'Повторити';

  @override
  String get detailContact => 'Контакти';

  @override
  String get detailAddress => 'Адреса';

  @override
  String get detailCompany => 'Компанія';

  @override
  String get detailEmail => 'Email';

  @override
  String get detailPhone => 'Телефон';

  @override
  String get detailWebsite => 'Сайт';

  @override
  String get detailCity => 'Місто';

  @override
  String get detailCompanyName => 'Назва';

  @override
  String get detailCatchPhrase => 'Слоган';
}
