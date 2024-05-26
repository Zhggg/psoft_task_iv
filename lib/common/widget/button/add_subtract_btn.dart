import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/widget/container/fixed_container_2btn.dart';
import 'package:task/features/home/model/product_list_model.dart';
import 'package:task/utils/routes/routes/route_constant.dart';

import '../../../features/cart/model/cart_model.dart';
import '../../../features/cart/provider/cart_provider.dart';
import '../../constant/sizes.dart';
import '../../constant/text_string.dart';
import '../container/fixed_container_abtn.dart';
import '../slideup/bottomsheet.dart';

class AddSubtract extends ConsumerStatefulWidget {
  final bool applyTextField;
  final ProductList products;

  const AddSubtract({
    super.key,
    this.applyTextField = false,
    required this.products,
  });

  @override
  ConsumerState<AddSubtract> createState() => _AddSubtractState();
}

class _AddSubtractState extends ConsumerState<AddSubtract> {
  num number = 1;
  final _quantityController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    final product = widget.products;
    return widget.applyTextField
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _quantityController,
                      decoration: InputDecoration(
                          labelText: AppTextString.quantityTitle,
                          labelStyle: Theme.of(context).textTheme.bodyLarge),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (double.tryParse(value) != null) {
                          number = double.parse(value);
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          double newValue = number - 1;
                          if (newValue >= 0) {
                            setState(() {
                              number = newValue;
                              _quantityController.text = number.toString();
                            });
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
                      IconButton(
                        onPressed: () {
                          setState(() {
                            number++;
                            _quantityController.text = number.toString();
                          });
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
              FixedContainerWith1Buttons(
                button2Text: AppTextString.addToCartBtn,
                onPressedButton2: () async {
                  final cartItem = CartItem(
                    imageUrl: product.imagePath,
                    brand: product.category!,
                    productId: product.productId,
                    name: product.productName!,
                    price: product.price!,
                    quantity: number,
                  );

                  await addToCart(ref, cartItem);
                  ShowModelBottomSheet.show(
                    context,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                        ),
                        child: Align(
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.check,
                                  size: 50,
                                ),
                              ),
                              Gap(20),
                              Text(
                                AppTextString.addToCartTitle,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Gap(10),
                              Text(
                                "$number Item Total",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              FixedContainerWith2Buttons(
                                onButtonSheet: true,
                                button1Text: AppTextString.backExploreBtn,
                                button2Text: AppTextString.toCartBtn,
                                onPressedButton2: () {
                                  setState(() {});

                                  context.pushNamed(
                                    AppRouteConstant.cartRouteName,
                                    extra: widget.products,
                                  );
                                },
                                onPressedButton1: () {
                                  Navigator.of(context).pop();
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                smallText: AppTextString.priceText,
                price: product.price! * number,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    number--;
                  });
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
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              ),
              Text(
                "$number",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    number++;
                  });
                },
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          );
  }
}
