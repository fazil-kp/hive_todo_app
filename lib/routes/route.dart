import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/helper/constants.dart';

import '../common_widgets/scaffold.dart';
import 'route_list.dart';

final GoRouter routeX = GoRouter(
  initialLocation: "/",
  redirectLimit: 3,
  errorBuilder: (context, state) {
    return CustomScaffold(
      childWidget: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go("/"),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  },
  navigatorKey: Const.navigatorKey,
  routes: buildRoutes(),
);

List<RouteBase> buildRoutes() {
  return [
    GoRoute(
      path: '/',
      parentNavigatorKey: Const.navigatorKey,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
        },
        child: const CustomScaffold(),
      ),
      routes: mainRoutes(),
    ),
  ];
}

List<GoRoute> mainRoutes() {
  List<GoRoute> mainRouteX = [];
  for (var route in MainRoute.mainRouteList) {
    if (route.routeName != null && route.widget != null) {
      mainRouteX.add(
        GoRoute(
          path: route.routeName!,
          name: route.routeName,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
              },
              child: route.widget!,
            );
          },
        ),
      );
    }
  }
  return mainRouteX;
}
