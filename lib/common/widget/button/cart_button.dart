import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task/utils/routes/routes/route_constant.dart';

import '../../../features/cart/provider/cart_provider.dart';

class CartButton extends ConsumerWidget {
  const CartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
      onPressed: () async {
        await loadCart(ref);
        context.pushNamed(AppRouteConstant.cartRouteName);
      },
      icon: const Icon(
        Icons.shopping_bag_outlined,
      ),
    );
  }
}
