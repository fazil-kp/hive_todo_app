import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/helper/constants.dart';
import 'package:project/view_model/student_vm.dart';
import 'routes/project_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: TodoProject()));
}

class TodoProject extends ConsumerWidget {
  const TodoProject({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: coreRoute,
      title: Const.appName,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown}),
      themeMode: ref.watch(studentVM).isLightTheme ? ThemeMode.light : ThemeMode.dark,
      // theme: AppTheme.getThemeData(ThemeMode.light),
      // darkTheme: AppTheme.getThemeData(ThemeMode.dark),
    );
  }
}
