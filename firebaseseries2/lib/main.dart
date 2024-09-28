
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseseries2/Screen/bottomnav/homescreen.dart';
import 'package:firebaseseries2/Screen/onboardingScreen.dart';
import 'package:firebaseseries2/Screen/onboardingScreen/splashscreen.dart';
import 'package:firebaseseries2/Screen/profile.dart';
import 'package:firebaseseries2/controllers/language_controller.dart';
import 'package:firebaseseries2/firebase_options.dart';
import 'package:firebaseseries2/utils/app_constant.dart';
import 'package:firebaseseries2/utils/app_routers.dart';
import 'package:firebaseseries2/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/dep.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 
  Map<String,Map<String,String>>_languages=await dep.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);

  runApp(MyApp(languages: _languages,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
      final Map<String,Map<String,String>>languages;

  @override
  Widget build(BuildContext context) {
  
    return GetBuilder<LocalizationController>(builder: (LocalizationController){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: LocalizationController.locale,
          translations: Message(languages:languages),
          fallbackLocale: Locale(AppConstant.languages[0].languageCode,
          AppConstant.languages[0].countryCode),
          initialRoute: RouteHelper.getSplashRoute(),
          getPages:RouteHelper.routes,
          home:SplashScreen());
    }
    );
  }
}
