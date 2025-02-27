import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/helper/constants.dart';
import 'package:project/helper/provider_list.dart';
import 'package:provider/provider.dart';

import 'routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: providerList,
      child: const TodoProject(),
    ),
  );
}

class TodoProject extends StatelessWidget {
  const TodoProject({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routeX,
      title: Const.appName,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown}),
      themeMode: ThemeMode.light,
      // theme: AppTheme.getThemeData(ThemeMode.light),
      // darkTheme: AppTheme.getThemeData(ThemeMode.dark),
    );
  }
}
