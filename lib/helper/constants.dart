import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Const {
  static const String appName = 'Faris Lectures';
  static const String restorationScopeId = "faris_lectures.0.1";
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static WidgetRef? notificationWidgetRef;
  static BuildContext? notificationContext;
}
