import 'dart:ui';

import 'package:get/get.dart';

import 'en.dart';


class LocalizationService extends Translations {
  static const locale = Locale("en");
  static const fallbackLocale = Locale("en");

  static final langs = [
    'english',
  ];

  static final locales = [
    Locale('en'),
  ];

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
      };

  changeLocale(String lang) {
    final locale = getlocaleFromLanguages(lang);
    return Get.updateLocale(locale);
  }

  Locale getlocaleFromLanguages(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }

    return Get.locale!;
  }
}
