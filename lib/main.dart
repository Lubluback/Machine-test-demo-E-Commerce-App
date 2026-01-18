import 'package:e_commerce_app_demo/core/hive_adapter/hive_adapter.dart';
import 'package:e_commerce_app_demo/feature/auth/login/view/login_screen.dart';
import 'package:e_commerce_app_demo/feature/cart/provider/cart_provider.dart';
import 'package:e_commerce_app_demo/feature/auth/login/provider/login_provider.dart';
import 'package:e_commerce_app_demo/feature/auth/signup/provider/signup_provider.dart';
import 'package:e_commerce_app_demo/feature/order/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'provider/product_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await SetupHiveAdapter.registerHiveAdapater();
  await SetupHiveAdapter.openAllBoxes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginPage(),
      ),
    );
  }
}
