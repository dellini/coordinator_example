import 'package:coordinator_example/coordinator_base.dart';
import 'package:coordinator_example/create_order_coordinator/_index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorKey: navigatorKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordinator example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Создать заказ'),
          onPressed: () {
            final shared = CoordinatorShared(
              dio: Dio(),
              navigator: RouteNavigator(
                navigatorKey: navigatorKey,
                routeBuilder: (widgetBuilder) =>
                    MaterialPageRoute(builder: widgetBuilder),
              ),
            );
            CreateOrderCoordinator(
              shared: shared,
              onCompleted: (order) {
                shared.navigator.pop(toFirst: true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 5),
                    content: Text(
                      'Заказ "${order.title}" на ${order.price}₽ создан',
                    ),
                  ),
                );
              },
            ).run();
          },
        ),
      ),
    );
  }
}
