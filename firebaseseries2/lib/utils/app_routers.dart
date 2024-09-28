import 'package:firebaseseries2/Screen/languagescreen.dart';
import 'package:firebaseseries2/Screen/onboardingScreen/splashscreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper{
  static const String initial='/';
  static const String splashscreen='/splashscreen';
  static const String language='/language';
  static String getSplashRoute()=>"$splashscreen";
   static String getInitialRoute()=>"$initial";
    static String getLanguagehRoute()=>"$language";
    static List<GetPage> routes=[
      GetPage(name:splashscreen,page:(){
        return SplashScreen();

      }),
      GetPage(name: language, page: (){
        return languagescreen();
      })
    ];

}