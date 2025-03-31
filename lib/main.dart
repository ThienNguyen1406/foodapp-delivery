import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodapp_delivery/pages/home_screen.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      // builder: (context, child) {
      //   return SafeArea(
      //     child: child ?? const SizedBox.shrink(),
      //   );
      // },
      initialRoute: AppRouter.splash,  
      routes: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
