import 'dart:convert';

import 'package:firebaseseries2/controllers/language_controller.dart';
import 'package:firebaseseries2/models/language_model.dart';
import 'package:firebaseseries2/utils/app_constant.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<Map<String,Map<String,String>>>init()async{

  final sharedPreferences= await SharedPreferences.getInstance();
  Get.lazyPut(()=>SharedPreferences);
  Get.lazyPut(()=>LocalizationController(sharedPreferences: Get.find()));
  Map<String,Map<String,String>>_languages=Map();
  for (LanguageModel languageModel in AppConstant.languages){
    String jsonStringValues = await rootBundle.loadString("assets/language/${languageModel.languageCode}.json");
    Map<String,dynamic>_mappedJson = json.decode(jsonStringValues);
    Map<String,String>_json= Map();
    _mappedJson.forEach((key,value){
      _json[key]=value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}']=_json;
  }
  return _languages;
}