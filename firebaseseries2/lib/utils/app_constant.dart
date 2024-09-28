import 'package:firebaseseries2/models/language_model.dart';

import '../Screen/language_model.dart';
class AppConstant {
  static const String COUNTRY_CODE ='country_code';
  static const String LANGUAGE_CODE ="language_code";
  static List<LanguageModel>languages=[
    LanguageModel(languageName: "English", countryCode: 'US', languageCode: 'en'),
    LanguageModel(languageName: "Português", countryCode: "PT", languageCode: 'pt')
  ];

}