import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_prak_tpm/screens/Login/LoginScreen.dart';
import 'package:project_prak_tpm/screens/Register/RegisterScreen.dart';
import 'package:project_prak_tpm/screens/SplashScreen.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Prak TPM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPallete.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/' : (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
