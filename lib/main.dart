import 'package:flutter/material.dart';
import 'package:tezos_asessment/app/presentation/pages/login.dart';
import 'package:tezos_asessment/core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: salemGreen),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

