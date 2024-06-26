import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_prak_tpm/model/PurchaseHistoryModel.dart';
import 'package:project_prak_tpm/model/UserModel.dart';
import 'package:project_prak_tpm/screens/Home/HomeScreen.dart';
import 'package:project_prak_tpm/screens/Login/LoginScreen.dart';
import 'package:project_prak_tpm/screens/Register/RegisterScreen.dart';
import 'package:project_prak_tpm/screens/SplashScreen.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';
import 'package:project_prak_tpm/utils/notification/NotificationService.dart';

late Box dataBox;

void main() async{
  // Notification Init
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  // Hive init
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(PurchaseHistoryModelAdapter());
  dataBox = await Hive.openBox('dataBox');
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
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
