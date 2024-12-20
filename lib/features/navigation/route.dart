import 'package:class_app/features/navigation/route_strings.dart';
import 'package:class_app/features/screens/Signup/signup_screen.dart';
import 'package:class_app/features/screens/bmiCalculator/calculate_screen.dart';
import 'package:class_app/features/screens/bmiCalculator/result_screen.dart';
import 'package:class_app/features/screens/future/future_builder_screen.dart';
import 'package:class_app/features/screens/home-screen.dart';
import 'package:class_app/features/screens/login/login_screen.dart';
import 'package:class_app/features/screens/manual_input-screen.dart';
import 'package:class_app/features/screens/tabbar/tabbar_screen.dart';
import 'package:class_app/features/screens/user_input_screen.dart';
import 'package:class_app/features/screens/welcome_screen.dart';
import 'package:class_app/layouts/grid-view.dart';
import 'package:class_app/layouts/list_view.dart';
import 'package:flutter/cupertino.dart';

import '../screens/carousel/carousel_screen.dart';
import '../screens/login/login_screen_2.dart';

class AppRoutes{

  static Route<dynamic>? appRoute(RouteSettings settings){
    switch (settings.name){
      case AppRouteStrings.gridView:
        return CupertinoPageRoute(builder: (_){
          return const GridViewScreen();
        });
      case AppRouteStrings.base:
        return CupertinoPageRoute(builder: (_){
          return const HomeScreen();
        });
      case AppRouteStrings.listView:
        return CupertinoPageRoute(builder: (_){
          return const ListViewScreen();
        });
      case AppRouteStrings.manualView:
        return CupertinoPageRoute(builder: (_){
          return  ManualInputScreen(arguments: settings.arguments as ManualInputArg);
        });
      case AppRouteStrings.userData:
        return CupertinoPageRoute(builder: (_){
          return  const UserInputScreen();
        });
      case AppRouteStrings.loginScreen:
        return CupertinoPageRoute(builder: (_){
          return  const LoginScreen();
        });
      case AppRouteStrings.loginScreen2:
        return CupertinoPageRoute(builder: (_){
          return  const LoginScreen2();
        });
      case AppRouteStrings.signupScreen:
        return CupertinoPageRoute(builder: (_){
          return  const SignupScreen();
        });
      case AppRouteStrings.welcomeScreen:
        return CupertinoPageRoute(builder: (_){
          return  const WelcomeScreen();
        });
      case AppRouteStrings.carouselScreen:
        return CupertinoPageRoute(builder: (_){
          return  const CarouselScreen();
        });
      case AppRouteStrings.tabBarScreen:
        return CupertinoPageRoute(builder: (_){
          return  const TabbarScreen();
        });
      case AppRouteStrings.calculateScreen:
        return CupertinoPageRoute(builder: (_){
          return  const CalculateScreen();
        });
      case AppRouteStrings.resultScreen:
        return CupertinoPageRoute(builder: (_){
          return   ResultScreen(
              resultsParams: settings.arguments as ResultsParams,
          );
        });
      case AppRouteStrings.futureScreen:
        return CupertinoPageRoute(builder: (_){
          return  const FutureBuilderScreen();
        });

      default:
        return CupertinoPageRoute(builder: (_){
          return const ListViewScreen();
        });
    }
  }
}