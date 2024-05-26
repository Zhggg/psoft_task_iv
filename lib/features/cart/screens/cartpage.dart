import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/text_string.dart';
import '../../../common/widget/image/circular_image.dart';
import '../../../common/widget/text/appbar_title.dart';
import '../../../utils/devices/device_utility.dart';
import '../../../utils/routes/routes/route_constant.dart';
import '../provider/cart_provider.dart';
import '../service/local_storage_service.dart';

class Cartpage extends ConsumerStatefulWidget {
  const Cartpage({
    super.key,
  });

  @override
  ConsumerState<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends ConsumerState<Cartpage> {
  late Future<void> _loadCartFuture = Future.value(null);

  @override
  void initState() {
    super.initState();
    final localStorageService = ref.read(localStorageProvider);
    _loadCartFuture = localStorageService.loadCart();
  }

  void _updateQuantity(String productId, int newQuantity) async {
    final localStorageService = ref.read(localStorageProvider);
    final updatedCart = ref.read(cartProvider).map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: newQuantity);
      } else {
        return item;
      }
    }).toList();
    await localStorageService.saveCart(updatedCart);
    ref.read(cartProvider.notifier).state = updatedCart;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = AppDeviceUtility.getScreenHeight(context);
   

    final cart = ref.watch(cartProvider);
    
    final localStorageService = ref.read(localStorageProvider);

    double totalSum = 0.0;
    for (var product in cart) {
      totalSum += product.price * product.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: AppTextString.cartTitle,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: screenHeight,
              child: FutureBuilder(
                future: _loadCartFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: cart.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final cartItem = cart[index];
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: DismissibleCartItem(
                                imageUrl: cartItem.imageUrl,
                                productId: cartItem.productId,
                                brand: cartItem.brand,
                                name: cartItem.name,
                                price: cartItem.price * cartItem.quantity,
                                quantity: cartItem.quantity,
                                onDelete: () async {
                                  await localStorageService
                                      .deleteCartItem(cartItem.productId!);
                                  ref.read(cartProvider.notifier).state =
                                      await localStorageService.loadCart();
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          FixedContainerWith1Buttons(
            smallText: AppTextString.grandTotal,
            price: totalSum,
            button2Text: AppTextString.checkOutBtn,
            onPressedButton2: () {
              context.pushNamed(AppRouteConstant.orderSummaryRouteName);
            },
          ),
        ],
      ),
    );
  }
}

class DismissibleCartItem extends ConsumerWidget {
  final String? imageUrl, productId;
  final String? name;
  final String? brand;
  final num? price;
  final num? quantity;
  final VoidCallback onDelete;

  const DismissibleCartItem({
    required this.imageUrl,
    required this.productId,
    required this.brand,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, ref) {
    void _updateQuantity(String productId, int newQuantity) async {
      final localStorageService = ref.read(localStorageProvider);
      final updatedCart = ref.read(cartProvider).map((item) {
        if (item.productId == productId) {
          return item.copyWith(quantity: newQuantity);
        } else {
          return item;
        }
      }).toList();
      await localStorageService.saveCart(updatedCart);
      ref.read(cartProvider.notifier).state = updatedCart;
    }

    final double screenWidth = AppDeviceUtility.getScreenWidth(context);
    return Dismissible(
      key: Key(productId!),
      background: Container(
        color: const Color.fromARGB(255, 251, 102, 91),
        child: Icon(
          Icons.delete_outline,
          color: AppColors.white,
        ),
      ),
      onDismissed: (direction) => onDelete(),
      child: Container(
        child: Stack(
          children: [
            Row(
              children: [
                CircularImage(
                  imagePath: imageUrl!,
                  fit: BoxFit.fill,
                  applyImageRadius: true,
                ),
                SizedBox(
                  width: AppSizes.md,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: AppSizes.sm,
                    ),
                    Text(
                      "$brand, Red Grey, 40, Qty $quantity",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      width: screenWidth - 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${price}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity! > 1) {
                                    _updateQuantity(
                                        productId!, (quantity! - 1).toInt());
                                  }
                                },
                                icon: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                              ),
                              Gap(10),
                              Text("${quantity}"),
                              Gap(10),
                              IconButton(
                                onPressed: () {
                                  _updateQuantity(
                                      productId!, (quantity! + 1).toInt());
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FixedContainerWith1Buttons extends ConsumerWidget {
  final String smallText;
  final double price;
  final String button2Text;
  final VoidCallback onPressedButton2;

  const FixedContainerWith1Buttons({
    required this.smallText,
    required this.price,
    required this.button2Text,
    required this.onPressedButton2,
  });

  @override
  Widget build(BuildContext context, ref) {
    final double screenWidth = AppDeviceUtility.getScreenWidth(context);
    return SizedBox(
      width: screenWidth,
      height: 100,
      child: Container(
        color: AppColors.light,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        smallText,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      "\$ ${price.toString()}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onPressedButton2,
                  child: SizedBox(
                    width: 165.0,
                    child: Center(
                      child: Text(
                        button2Text,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                        
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
