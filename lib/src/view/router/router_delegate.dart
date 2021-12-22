import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/common/logger/logger.dart';

import 'router/router.dart';

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>, ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, List<RouteInfo>>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, stack) {
        if (stack.isEmpty) return Container();

        Log().writer.log(stack);
        return Navigator(
          key: navigatorKey,
          pages: stack.map((e) => WeatherAppPage(child: e.builder(context), id: e.id)).toList(),
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;
            context.read<RouterBloc>().add(RouterEvent.onPop());
            return true;
          },
        );
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {}
}

class WeatherAppPage extends Page {
  final Widget child;
  final String id;

  const WeatherAppPage({
    required this.child,
    required this.id,
  });

  @override
  Route createRoute(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: this, builder: (_) => child)
        : MaterialPageRoute(settings: this, builder: (_) => child);
  }
}

class RouteInfo {
  RouteInfo({
    required this.id,
    required this.builder,
  });

  final String id;

  final WidgetBuilder builder;

  @override
  String toString() {
    return 'Route{id: $id, builder: $builder}';
  }
}
