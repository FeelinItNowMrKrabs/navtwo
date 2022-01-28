import 'package:flutter/material.dart';
import 'package:navtwo/rounter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  void _goLanding(BuildContext context) {
    AppRouterDelegate router = context.read<AppRouterDelegate>();
    router.setNewRoutePath(const AppLinkHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          const Center(
            child: Text('Settings'),
          ),
          ElevatedButton(
              onPressed: () {
                _goLanding(context);
              },
              child: const Text('Go landing')),
          Spacer(),
        ],
      ),
    );
  }
}
