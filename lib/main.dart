import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:core/constants/config/core_theme.dart';
import 'package:core/helpers/core_helpers.dart';
import 'routes/project_routes.dart';
import 'view_model/riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MainProject()));
}



class MainProject extends ConsumerWidget {
  const MainProject({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: coreRoute,
      title: Const.appName,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown}),
      themeMode: ref.watch(studentVM).isLightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.getThemeData(ThemeMode.light),
      darkTheme: AppTheme.getThemeData(ThemeMode.dark),
    );
  }
}
