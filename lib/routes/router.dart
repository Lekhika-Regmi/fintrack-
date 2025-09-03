import 'package:fin_track/screens/auth/login_screen.dart';
import 'package:fin_track/screens/auth/signup_screen.dart';
import 'package:fin_track/screens/home_screen.dart';
import 'package:fin_track/screens/splash_screen.dart';
import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
  ],
);
