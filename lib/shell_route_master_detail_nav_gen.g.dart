// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shell_route_master_detail_nav_gen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        ShellRouteData.$route(
          factory: $SettingsMasterDetailRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'settings',
              name: 'settings-empty',
              factory: $SettingsEmptyRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'settings/:settingName',
              name: 'setting-name',
              factory: $SettingsDetailsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsMasterDetailRouteExtension on SettingsMasterDetailRoute {
  static SettingsMasterDetailRoute _fromState(GoRouterState state) =>
      SettingsMasterDetailRoute();
}

extension $SettingsEmptyRouteExtension on SettingsEmptyRoute {
  static SettingsEmptyRoute _fromState(GoRouterState state) =>
      SettingsEmptyRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsDetailsRouteExtension on SettingsDetailsRoute {
  static SettingsDetailsRoute _fromState(GoRouterState state) =>
      SettingsDetailsRoute(
        settingName: state.pathParameters['settingName']!,
      );

  String get location => GoRouteData.$location(
        '/settings/${Uri.encodeComponent(settingName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
