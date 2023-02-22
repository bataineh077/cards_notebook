import 'package:cards_notebook/presentation/pages/home_page.dart';
import 'package:cards_notebook/presentation/pages/splash_page.dart';
import 'package:cards_notebook/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';


class Routes{


  static const String splashRoute = '/';

  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
  static const String onboardingRoute = '/onboarding';

}

class RouteGenerator{

  static Route<dynamic> genRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      //
      // case Routes.loginRoute:
      //   return MaterialPageRoute(builder: (_) => const LoginView());

      // case Routes.registerRoute:
      //   return MaterialPageRoute(builder: (_) => const RegisterView());
      //
      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      // case Routes.storeDetailsRoute:
      //   return MaterialPageRoute(builder: (_) => const StoreDetailsView());

      // case Routes.onboardingRoute:
      //   return MaterialPageRoute(builder: (_) => const On());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){

    return MaterialPageRoute(builder: (_)=> Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noFoundRoutes) ,),
      body: const Center(
        child: Text(AppStrings.noFoundRoutes),
      ),
    ));
  }

}