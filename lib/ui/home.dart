import 'package:flutter/material.dart';
import 'package:navtwo/rounter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _goSettings(BuildContext context) {
    AppRouterDelegate router = context.read<AppRouterDelegate>();
    router.setNewRoutePath(const AppLinkLanding());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          const Center(
            child: Text('Home'),
          ),
          ElevatedButton(
              onPressed: () {
                _goSettings(context);
              },
              child: const Text('Go settings')),
          Spacer(),
        ],
      ),
    );
  }
}
