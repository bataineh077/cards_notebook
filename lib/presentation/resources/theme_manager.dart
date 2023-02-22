
import 'package:cards_notebook/presentation/resources/styles_manager.dart';
import 'package:cards_notebook/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    // card view
   cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
     elevation: AppSize.s4,

  ),

    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(fontSize: FontSize.s16,color: ColorManager.white)
    ),

    //button theme

     buttonTheme: ButtonThemeData(
       shape: const StadiumBorder(),
       disabledColor: ColorManager.grey1,
       buttonColor: ColorManager.primary,
       splashColor: ColorManager.lightPrimary,
     ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s17 ),
        primary: ColorManager.primary,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)
        )
      )
    ),

// Text Theme
      textTheme: TextTheme(
        headlineLarge: getSemiBoldStyle(color: ColorManager.darkGray, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(color: ColorManager.darkGray, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(color: ColorManager.lightGray,fontSize: FontSize.s14),
        bodyLarge: getRegularStyle(color: ColorManager.grey1, ),
        bodySmall: getRegularStyle(color: ColorManager.grey1),
        displayLarge: getLightStyle(color: ColorManager.white,fontSize: FontSize.s22)
      ),

    // input decoration theme

  inputDecorationTheme: InputDecorationTheme(


    contentPadding: const EdgeInsets.all(AppPadding.p8),



    hintStyle: getRegularStyle(color: ColorManager.gray , fontSize: FontSize.s14),
    labelStyle: getMediumStyle(color: ColorManager.gray, fontSize: FontSize.s14 ),
    errorStyle: getRegularStyle(color: ColorManager.error,),




    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.gray,width: AppSize.s1_5),
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
    ),

    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
    ),

    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
    ),

    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
    ),
  ),



  );
}