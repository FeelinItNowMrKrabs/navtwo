import 'package:flutter/material.dart';
import 'package:navtwo/rounter.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Widget app = Provider<RouterDelegate>(create: (_) => AppRouterDelegate(), child: const NavTwoApp());
  // runApp(app);

  runApp(const NavTwoApp());
}

class NavTwoApp extends StatefulWidget {
  const NavTwoApp({Key? key}) : super(key: key);

  @override
  State<NavTwoApp> createState() => _NavTwoAppState();
}

class _NavTwoAppState extends State<NavTwoApp> {
  AppRouterDelegate routerDelegate = AppRouterDelegate();
  AppRouteInformationParser routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppRouterDelegate>.value(value: routerDelegate),
      ],
      child: MaterialApp.router(
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      ),
    );
  }
}

/*
class NavTwoApp extends StatelessWidget {
  NavTwoApp({Key? key}) : super(key: key);
  AppRouteInformationParser routeInformationParser =
      AppRouteInformationParser();
  AppRouterDelegate routerDelegate = AppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: routeInformationParser,
      routerDelegate: routerDelegate,
      //
    );

    /*
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product Info'),
          backgroundColor: Colors.amberAccent,
        ),
        backgroundColor: Colors.blue,
        body: const Center(
          child: Text('First'),
        ),
      ),*/
  }
}
*/