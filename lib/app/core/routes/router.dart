import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hail/app/core/routes/router.gr.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType {
    return RouteType.custom(transitionsBuilder: TransitionsBuilders.slideRight);
  }

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: GetStartedRoute.page, path: '/get-started', initial: true),

    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(
      page: SignUpRoute.page,
      path: '/sign up',

      // children: [AutoRoute(page: CountrySelectionRoute.page, path: 'country-selection/:country')],
    ),
  ];
}
