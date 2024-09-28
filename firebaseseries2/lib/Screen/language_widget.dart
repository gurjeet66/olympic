import 'package:firebaseseries2/controllers/language_controller.dart';
import 'package:firebaseseries2/models/language_model.dart';
import 'package:firebaseseries2/utils/app_constant.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget({super.key, required this.languageModel, required this.localizationController, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        localizationController.setLanguage(Locale(
          AppConstant.languages[index].languageCode,
          AppConstant.languages[index].countryCode,));
localizationController.setSelectIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 5,spreadRadius: 1
          )],
        ),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,),
                  Text(languageModel.languageName,),
                
              ],
            ),
          ),
          localizationController.selectedIndex==index? Positioned(
          top:0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Icon(Icons.check_circle,color: Theme.of(context).primaryColor,size:30)
          ):SizedBox()
        ],),
      ),
    );
  }
}