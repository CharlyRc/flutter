import 'package:exam_flutter/page/home_page.dart';
import 'package:exam_flutter/page/about_us_page.dart';
import 'package:exam_flutter/page/detail_page.dart';
import 'package:exam_flutter/page/paiement_page.dart';
import 'package:flutter/material.dart';
import 'package:exam_flutter/page/cart_page.dart';
import 'package:go_router/go_router.dart';

import 'bo/article.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => HomePage(), routes: [
    GoRoute(
      path: 'cart',
      builder: (_, __) => CartPage(title: "test"),
    ),
    GoRoute(
      path: 'about-us',
      builder: (_, __) => AboutUsPage(),
    ),
    GoRoute(
      path: 'detail',
      builder: (_, state) => DetailPage(article: state.extra as Article),
    ),
    GoRoute(
      path: 'paiement-page',
      builder: (_, state) => PaiementPage(),
    ),
  ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 20)),
      ),
      routerConfig: _router,
    );
  }
}
