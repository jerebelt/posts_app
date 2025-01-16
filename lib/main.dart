import 'package:flutter/material.dart';

import 'core/core.dart';
import 'core/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: goRouterSettings,
      debugShowCheckedModeBanner: false,
    );
  }
}
