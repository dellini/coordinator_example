import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CoordinatorBase {}

typedef RouteBuilder = Route Function(WidgetBuilder widgetBuilder);

abstract class RouteNavigator {
  factory RouteNavigator({
    required RouteBuilder routeBuilder,
    GlobalKey<NavigatorState>? navigatorKey,
  }) =>
      _RouteNavigatorImpl(routeBuilder, navigatorKey);

  GlobalKey<NavigatorState> get navigatorKey;

  void push(WidgetBuilder widgetBuilder);
  void replaceFirst(WidgetBuilder widgetBuilder);
  void replaceSecond(WidgetBuilder widgetBuilder);
  void pop({bool toFirst = false});
}

class _RouteNavigatorImpl implements RouteNavigator {
  _RouteNavigatorImpl(
    this._routeBuilder,
    GlobalKey<NavigatorState>? navigatorKey,
  ) {
    this.navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();
  }

  @override
  late final GlobalKey<NavigatorState> navigatorKey;
  final RouteBuilder _routeBuilder;

  @override
  void push(WidgetBuilder widgetBuilder, {RouteBuilder? routeBuilder}) =>
      navigatorKey.currentState?.push(_routeBuilder(widgetBuilder));

  @override
  void replaceFirst(WidgetBuilder widgetBuilder,
          {RouteBuilder? routeBuilder}) =>
      navigatorKey.currentState
          ?.pushAndRemoveUntil(_routeBuilder(widgetBuilder), (_) => false);

  @override
  void replaceSecond(WidgetBuilder widgetBuilder,
          {RouteBuilder? routeBuilder}) =>
      navigatorKey.currentState
          ?.pushAndRemoveUntil(_routeBuilder(widgetBuilder), (_) => _.isFirst);

  @override
  void pop({bool toFirst = false}) => toFirst
      ? navigatorKey.currentState?.popUntil((route) => route.isFirst)
      : navigatorKey.currentState?.pop();
}

class CoordinatorShared {
  CoordinatorShared({
    required this.dio,
    required this.navigator,
  });

  final Dio dio;
  final RouteNavigator navigator;
}

abstract class Coordinator<T> {
  Coordinator({
    required this.shared,
    RouteNavigator? navigator,
    this.onCompleted,
  }) : _navigator = navigator {
    setup();
  }

  @protected
  final CoordinatorShared shared;
  final RouteNavigator? _navigator;

  final void Function(T)? onCompleted;

  @protected
  RouteNavigator get navigator => _navigator ?? shared.navigator;

  void setup();
  void run();
}
