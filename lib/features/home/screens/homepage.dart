import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/widget/button/cart_button.dart';

import '../../../common/constant/text_string.dart';
import '../../../common/widget/button/elevated_with_icon.dart';
import '../../../common/widget/text/appbar_title.dart';
import '../../../utils/helper/helper_function.dart';
import '../../../utils/routes/routes/route_constant.dart';
import '../model/category_list_model.dart';
import '../model/product_list_model.dart';
import 'widget/product_grid_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CategoryList selectedCategory = categoryList.first;
  List<ProductList> filteredProductList = productList;

  void onCategorySelected(CategoryList category) {
    setState(() {
      selectedCategory = category;
      filteredProductList = filterProducts(productList, category);
    });
  }

  List<ProductList> filterProducts(
      List<ProductList> products, CategoryList category) {
    if (category.category == ProductCategoryEnum.all) {
      return products;
    } else {
      return products
          .where((product) => product.category == category.name)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = AppHelperFunctions.screenSize(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: AppBarTitle(
          title: AppTextString.hometitle,
          bigTitle: true,
        ),
        actions: [
          CartButton(),
          IconButton(
            onPressed: () async {
              try {
                await _auth.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You\'re logged out successfully!'),
                    backgroundColor: Colors.green,
                    duration: const Duration(milliseconds: 1200),
                  ),
                );
              } catch (e) {
                print(e.toString());
              }
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ProductGridView(),
            Positioned(
              bottom: screenSize.height * 0.1,
              left: (screenSize.width - 120.0) / 2,
              child: ElevatedButtonWithIcon(
                btnText: AppTextString.filterBtn,
                icon: Icons.filter_list,
                buttonWidth: 130,
                isRoundBorder: true,
                onPressed: () {
                  context.pushNamed(AppRouteConstant.filterRouteName,
                      extra: filteredProductList);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
