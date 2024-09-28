import 'package:firebaseseries2/Screen/language_widget.dart';
import 'package:firebaseseries2/controllers/language_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class languagescreen extends StatelessWidget {
  const languagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<LocalizationController>(builder: (localizationController){
            return Column(
                    children: [
            Expanded(
                child: Center(
              child: Scrollbar(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(5),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("select laguage"),
                        ),
                        GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1),
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => 
                            // Container(
                            //       width: 300,
                            //       height: 300,
                            //       color: index == 0 ? Colors.white : Colors.black,
                            //     )),
                                LanguageWidget(languageModel: localizationController.languages[index], localizationController: localizationController, index: index),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("you_can_change_language".tr)
                      ],
                    ),
                  ),
                ),
              )),
            ))
                    ],
                  );
   } )),
  
    );

  }
}
