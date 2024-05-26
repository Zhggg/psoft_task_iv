import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/constant/colors.dart';
import 'package:task/common/constant/sizes.dart';
import 'package:task/utils/routes/routes/route_constant.dart';

import '../../../common/constant/text_string.dart';
import '../../../common/widget/container/fixed_container_abtn.dart';
import '../../../common/widget/text/appbar_title.dart';
import '../../../utils/devices/device_utility.dart';
import '../../cart/provider/cart_provider.dart';
import '../../cart/service/local_storage_service.dart';
import '../models/order_model.dart';

class CheckoutsPage extends ConsumerStatefulWidget {
  const CheckoutsPage({super.key});

  @override
  ConsumerState<CheckoutsPage> createState() => _CheckoutsPageState();
}

class _CheckoutsPageState extends ConsumerState<CheckoutsPage> {
  bool isExpanded = false;
  String _selectedPayment = 'Credit Card';
  List<String> paymentMethods = ['Credit Card', 'Debit Card', 'E-Wallet'];
  String _selectedLocation = 'Semarang, Indonesia';
  List<String> locations = [
    'Semarang, Indonesia',
    'Jakarta, Indonesia',
    'Surabaya, Indonesia'
  ];

  late Future<void> _loadProductFuture = Future.value(null);

  @override
  void initState() {
    super.initState();
    final localStorageService = ref.read(localStorageProvider);
    _loadProductFuture = localStorageService.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = AppDeviceUtility.getScreenHeight(context);
    final cart = ref.watch(cartProvider);

    final subTotal = cart.fold(
      0.0,
      (previousValue, cartItem) =>
          previousValue + (cartItem.quantity * cartItem.price),
    );
    final shippingPrice = (5.00 + Random().nextInt(11)).toDouble();

    final totalOrder = subTotal + shippingPrice;
    return Scaffold(
      appBar: AppBar(title: AppBarTitle(title: AppTextString.checkoutTitle)),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.lg,
          ),
          child: SizedBox(
            height: screenHeight,
            child: ListView(
              children: [
                SizedBox(height: AppSizes.appBarHeight),
                //Information Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTextString.infoHeading,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Gap(
                      AppSizes.md,
                    ),
                    //Payment Method
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTextString.paymentMethod,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: DropdownButton<String>(
                            value: _selectedPayment,
                            isExpanded: true,
                            items: paymentMethods
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: item == _selectedPayment
                                            ? Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                            : null,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedPayment = newValue!;
                              });
                            },
                            icon: Icon(
                              _selectedPayment.isNotEmpty
                                  ? Icons.keyboard_arrow_right
                                  : Icons.keyboard_arrow_down,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(
                      AppSizes.lg,
                    ),
                    // Location Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTextString.location,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: DropdownButton<String>(
                            value: _selectedLocation,
                            isExpanded: true,
                            items: locations
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: item == _selectedLocation
                                            ? Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                            : null,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLocation = newValue!;
                              });
                            },
                            icon: Icon(
                              _selectedLocation.isNotEmpty
                                  ? Icons.keyboard_arrow_right
                                  : Icons.keyboard_arrow_down,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(
                  AppSizes.lg,
                ),
                //Order Detail Section
                Consumer(
                  builder: (context, ref, child) {
                    final cartItems = ref.watch(cartProvider);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(AppSizes.spaceBtwSections),
                        Text(
                          AppTextString.orderDetailHeading,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Gap(
                          AppSizes.md,
                        ),
                        SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cartItems
                                  .length, // Use the length of the cartItems list
                              itemBuilder: (context, index) {
                                final cartItem = cartItems[
                                    index]; // Get the current cart item
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.name, // Display the product name
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Opacity(
                                          opacity: 0.5,
                                          child: Text(
                                            "${cartItem.brand}, Red Grey, 40, Qty ${cartItem.quantity}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        Text(
                                          '\$${(cartItem.quantity * cartItem.price).toStringAsFixed(2)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Gap(
                          AppSizes.md,
                        ),
                      ],
                    );
                  },
                ),
                Gap(
                  AppSizes.lg,
                ),
                //Payment Detail Section
                Consumer(
                  builder: (context, ref, child) {
                    final cartItems = ref.watch(cartProvider);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(AppSizes.spaceBtwSections),
                        Text(
                          AppTextString.paymentDetailHeading,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Gap(
                          AppSizes.md,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Sub Total Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    AppTextString.subTotal,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Gap(
                                  AppSizes.xl,
                                ),
                                Text(
                                  '\$${subTotal.toStringAsFixed(2)}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Gap(
                              AppSizes.lg,
                            ),
                            //Shipping Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    AppTextString.shipping,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Gap(
                                  AppSizes.xl,
                                ),
                                Text(
                                  '\$${shippingPrice.toStringAsFixed(2)}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Gap(
                              AppSizes.lg,
                            ),
                            //total Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    AppTextString.totalOrder,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Gap(
                                  AppSizes.xl,
                                ),
                                Text(
                                  '\$${totalOrder.toStringAsFixed(2)}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        FixedContainerWith1Buttons(
          smallText: AppTextString.grandTotal,
          price: totalOrder,
          button2Text: AppTextString.paymentBtn,
          onPressedButton2: () async {
            // Get the user ID from sign-in with Google

            // Get the order data
            final double subTotal = cart.fold(
              0.0,
              (previousValue, cartItem) =>
                  previousValue + (cartItem.quantity * cartItem.price),
            );
            final double shippingPrice =
                (5.00 + Random().nextInt(11)).toDouble();
            final double totalOrder = subTotal + shippingPrice;
            final List<OrderItem> items = cart.map((cartItem) {
              return OrderItem(
                productId: cartItem.productId!,
                name: cartItem.name,
                quantity: cartItem.quantity,
                price: cartItem.price,
                image: cartItem.imageUrl!,
              );
            }).toList();
            final OrderStatus orderStatus = OrderStatus.pending;
            final String paymentMethod = _selectedPayment;
            final DateTime orderDate = DateTime.now();
            final String location = _selectedLocation;

            // Save the order data in Cloud Firestore
            final FirebaseFirestore firestore = FirebaseFirestore.instance;
            await firestore.collection('orders').add({
              'items': items.map((item) => item.toJson()).toList(),
              'totalPrice': totalOrder,
              'orderStatus': orderStatus.index,
              'paymentMethod': paymentMethod,
              'orderDate': orderDate,
              'location': location,
            });

            // Clear the cart after placing the order
            final localStorageService = ref.read(localStorageProvider);
            localStorageService.clearCart();

            // Go to the order success screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.success,
                content: Text('Order successfully placed'),
                duration: Duration(seconds: 2),
              ),
            );

            context.goNamed(
              AppRouteConstant.homeRouteName,
            );
          },
        ),
      ]),
    );
  }
}
