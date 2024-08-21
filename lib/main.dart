import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'app/routes.dart';
import 'services/theme/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeServiceProvider);

    return MaterialApp.router(
      title: 'Games!',
      theme: themeState.light,
      darkTheme: themeState.dark,
      themeMode: themeState.mode,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      routerConfig: ref.watch(goRouterProvider),
      builder: FlutterSmartDialog.init(),
    );
  }
}
