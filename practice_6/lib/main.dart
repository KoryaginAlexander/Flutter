import 'package:flutter/material.dart';
import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Архиваторы',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7CB342)),
          useMaterial3: true,
        ),
        initialRoute: Routes.loading,
        routes: {
          Routes.loading: (_) => const LoadingPage(),
          Routes.login: (_) => const LoginPage(),
          Routes.register: (_) => const RegisterPage(),
          Routes.home: (_) => const HomePage(),
          Routes.profile: (_) => const ProfilePage(),
          Routes.detail: (_) => const DetailPage(),
        },
      );
}
