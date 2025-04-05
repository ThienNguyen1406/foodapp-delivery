import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodapp_delivery/pages/login_screen.dart';
import 'package:foodapp_delivery/provider/cart_provider.dart';
import 'package:foodapp_delivery/provider/loading_provider.dart';
import 'package:foodapp_delivery/router/app_router.dart';
import 'package:foodapp_delivery/widget/key_board_dismis.dart';
import 'package:foodapp_delivery/widget/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('vi', null); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: Consumer<LoadingProvider>(
        builder: (context, loading, child) {
          return KeyboardDismiss(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Stack(
                children: [
                  MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      useMaterial3: true,
                    ),
                    initialRoute: AppRouter.splash,
                    routes: AppRouter.routes,
                    home: LoginScreen(),
                    // đa ngôn ngữ
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en', 'US'),
                      Locale('vi', 'VN'),
                    ],
                  ),
                  loading.isLoading
                      ? const LoadingWidget()
                      : const SizedBox.shrink()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
