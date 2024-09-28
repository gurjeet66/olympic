import 'dart:ffi';
import 'dart:ui';

import 'package:firebaseseries2/models/language_model.dart';
import 'package:firebaseseries2/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController implements GetxService{
  final SharedPreferences sharedPreferences;
  LocalizationController({required this .sharedPreferences}){
    loadCurrentLanguage();
  }
  Locale _locale = Locale(AppConstant.LANGUAGE_CODE[0],
  AppConstant.languages[0].countryCode);
  Locale get locale=>_locale;
  int _selectedIndex =0;
  int get selectedIndex => _selectedIndex;
  List<LanguageModel>_languages=[]; 
 
  List<LanguageModel> get languages=>_languages;
  
  void loadCurrentLanguage() async{
    _locale = Locale(sharedPreferences.getString(AppConstant.LANGUAGE_CODE)??
    AppConstant.languages[0].languageCode ,
    sharedPreferences.getString(AppConstant.COUNTRY_CODE)??
    AppConstant.languages[0].countryCode);
    for (int index =0;index<AppConstant.languages.length;index++){
      if(AppConstant.languages[index].languageCode==_locale.languageCode){
        _selectedIndex = index;
        break;
      }
    }
    _languages=[];
    _languages.addAll(AppConstant.languages);
    update();
    }
    Future setLanguage(Locale locale) async {
      Get.updateLocale(locale);
      _locale = locale;
      saveLanguage(_locale);
      update();
    }
    void setSelectIndex(int index){
      _selectedIndex= index;
      update();
    }
    void saveLanguage(Locale locale){
      sharedPreferences.setString(AppConstant.LANGUAGE_CODE, locale.languageCode);
      sharedPreferences.setString(AppConstant.COUNTRY_CODE,locale.countryCode!);
    }
  }

