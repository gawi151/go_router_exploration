import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'shell_route_master_detail_nav_gen.g.dart';

@TypedGoRoute<HomeRoute>(path: '/', name: 'home', routes: [
  TypedShellRoute<SettingsMasterDetailRoute>(routes: [
    TypedGoRoute<SettingsEmptyRoute>(
      path: 'settings',
      name: 'settings-empty',
    ),
    TypedGoRoute<SettingsDetailsRoute>(
      path: 'settings/:settingName',
      name: 'setting-name',
    ),
  ]),
])
class HomeRoute extends WebGoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            const Text('home'),
            ElevatedButton(
              onPressed: () => SettingsEmptyRoute().go(context),
              child: const Text('Go to settings'),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsMasterDetailRoute extends WebShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return SettingsMasterDetailShell(child: navigator);
  }
}

class SettingsEmptyRoute extends WebGoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(child: Text('Select setting on the list'));
  }
}

class SettingsDetailsRoute extends WebGoRouteData {
  SettingsDetailsRoute({required this.settingName});

  final String settingName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Center(child: Text('settings details ($settingName)'));
  }
}

class SettingsMasterDetailShell extends StatelessWidget {
  const SettingsMasterDetailShell({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Shell'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Settings 1'),
                  onTap: () {
                    SettingsDetailsRoute(settingName: 'setting 1').go(context);
                  },
                ),
                ListTile(
                  title: const Text('Settings 2'),
                  onTap: () {
                    SettingsDetailsRoute(settingName: 'setting 2')
                    .go(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: child,
          ),
        ],
      ),
    );
  }
}

class WebGoRouteData extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: build(context, state));
  }
}

class WebShellRouteData extends ShellRouteData {
  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) =>
      NoTransitionPage(
        child: builder(context, state, navigator),
      );
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      routes: $appRoutes,
    );
    return MaterialApp.router(
      theme: ThemeData.from(colorScheme: const ColorScheme.light()),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      routerConfig: goRouter,
    );
  }
}
