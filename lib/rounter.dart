import 'package:flutter/material.dart';
import 'package:navtwo/ui/home.dart';
import 'package:navtwo/ui/settings.dart';
import 'package:uuid/uuid.dart';

class AppLink {
  const AppLink();
}

/*
class AppLink {
  final int type; // 1 = home, 2 = landing

  const AppLink({required this.type});
}
*/

class AppLinkHome extends AppLink {
  const AppLinkHome();
}

class AppLinkLanding extends AppLink {
  const AppLinkLanding();
}

class AppRouteInformationParser extends RouteInformationParser<AppLink> {
  @override
  Future<AppLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    return const AppLink();
  }
}

class AppRouterDelegate extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AppLink appLink = const AppLink();

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    appLink = configuration;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Page> pages = [];

    if (appLink is AppLinkHome) {
      pages.add(const MaterialPage(
          key: ValueKey('home-screen'), child: HomeScreen()));
    }
    if (appLink is AppLinkLanding) {
      pages.add(const MaterialPage(
          key: ValueKey('settings-screen'), child: SettingsScreen()));
    }
    if (pages.isEmpty) {
      pages.add(const MaterialPage(
          key: ValueKey('home-screen'), child: HomeScreen()));
    }
    return Navigator(
        pages: pages,
        key: navigatorKey,
        onPopPage: (route, result) {
          print(route);
          return route.didPop(result);
        });
  }
}
