import 'package:flutter/material.dart';
import 'package:on_boarding_elancer2/login_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/faqs_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/favorite_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/frequent_question_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/second_favorite_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/thired_tab_screen.dart';
import 'package:on_boarding_elancer2/screens/app/bottom_navigation_screen.dart';
import 'package:on_boarding_elancer2/screens/app/categories_screen.dart';
import 'package:on_boarding_elancer2/screens/app/home_screen.dart';
import 'package:on_boarding_elancer2/screens/app/users_screen.dart';
import 'package:on_boarding_elancer2/launch_screen.dart';
import 'package:on_boarding_elancer2/screens/onboarding/onBoarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/onBoarding_screen': (context) => const OnBoardingScreen(),
        '/login_screen': (context) => const LogInScreen(),
        '/users_screen': (context) => const UsersScreen(),
        '/categories_screen': (context) => const CategoriesScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/bottom_navigation_screen': (context) => const BottomNavigationScreen(),
        '/faqs_screen': (context) => const FaqsScreen(),
        '/frequent_question_screen': (context) => const FrequentQuestionScreen(),
        '/favorite_screen': (context) => const FavoriteScreen(),
        '/second_favorite_screen': (context) => const SecondFavoriteScreen(),
        '/thired_tab_screen': (context) => const ThiredFavoriteScreen(),
      },
    );
  }
}
