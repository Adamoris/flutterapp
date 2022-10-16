import 'package:my_app/about/about.dart';
import 'package:my_app/profile/profile.dart';
import 'package:my_app/login/login.dart';
import 'package:my_app/topics/topics.dart';
import 'package:my_app/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  // '/login': (context) => const LoginScreen(),
  // '/topics': (context) => const TopicsScreen(),
  // '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
