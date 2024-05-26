import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/features/auth/screen/login_page.dart';
import 'package:task/features/cart/screens/cartpage.dart';
import 'package:task/features/checkouts/screens/checkoutspage.dart';
import 'package:task/features/product_detail/screens/product_detail_page.dart';
import 'package:task/features/review/screens/reviewpage.dart';

import '../../../features/filter/screens/filterpage.dart';
import '../../../features/home/model/product_list_model.dart';
import '../../../features/home/screens/homepage.dart';
import 'route_constant.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    //--- Signin Page ---
    GoRoute(
      name: AppRouteConstant.homeRouteName,
      path: '/',
      // builder: (context, _) => const RootScreen(),
      builder: (context, _) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData && snapshot.data != null) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    ),
    // GoRoute(
    //   name: AppRouteConstant.homeRouteName,
    //   path: "/",
    //   builder: (context, state) => const HomePage(),
    // ),
    GoRoute(
      name: AppRouteConstant.filterRouteName,
      path: "/filter",
      builder: (context, state) => const FilterPage(),
    ),
    GoRoute(
        name: AppRouteConstant.productDetailRouteName,
        path: '/product/:productId',
        builder: (context, state) {
          final product = ProductList.fromMap(
              jsonDecode(state.uri.queryParameters['product'] as String));

          return ProductDetailPage(
            product: product,
            // averageRating: averageRating,
            // reviewCount: reviewCount,
          );
        }),
    GoRoute(
      name: AppRouteConstant.cartRouteName,
      path: "/cart",
      builder: (context, state) => const Cartpage(),
    ),
    GoRoute(
      name: AppRouteConstant.reviewRouteName,
      path: "/review",
      builder: (context, state) {
        final product = ProductList.fromMap(
            jsonDecode(state.uri.queryParameters['product'] as String));

        return ReviewPage(
          product: product,
        );
      },
    ),
    GoRoute(
      name: AppRouteConstant.orderSummaryRouteName,
      path: "/checkout",
      builder: (context, state) => const CheckoutsPage(),
    ),
  ]);
}
