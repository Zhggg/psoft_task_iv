import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/common/widget/button/color_btn_list.dart';
import 'package:task/features/filter/utils/filter_utils.dart';
import 'package:task/features/home/model/category_list_model.dart';
import 'package:task/features/home/providers/home_provider.dart';

import '../../../common/constant/sizes.dart';
import '../../../common/constant/text_string.dart';
import '../../../common/widget/container/fixed_container_2btn.dart';
import '../../../common/widget/text/appbar_title.dart';
import '../../../common/widget/text/brand_name.dart';
import '../../../utils/devices/device_utility.dart';
import 'widget/brandwidget.dart';

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  RangeValues _currentRangeValues = const RangeValues(0, 1750);
  bool selected = false;
  List<String> buttonList = [
    AppTextString.listBtn1,
    AppTextString.listBtn2,
    AppTextString.listBtn3,
  ];

  @override
  void initState() {
    Future(() {
      if (ref.read(homeProvider).selectedCategory.name != "All") {
        ref
            .read(homeProvider.notifier)
            .updateFilter(ref.read(homeProvider).filterModel.copyWith(
                  category: brandFilterings.firstWhere((element) =>
                      element.title.toLowerCase() ==
                      ref
                          .read(homeProvider)
                          .selectedCategory
                          .name
                          .toLowerCase()),
                ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = AppDeviceUtility.getScreenHeight(context);

    final homeState = ref.watch(homeProvider);
    final homeController = ref.watch(homeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: AppTextString.filterTitle,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: screenHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Brand Section
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSizes.lg,
                      right: AppSizes.md,
                      top: AppSizes.appBarHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BrandName(
                          brandName: AppTextString.brandTitle,
                        ),
                        const SizedBox(
                          height: AppSizes.spaceBtwItems,
                        ),
                        FilterBrandwidget(
                          selected: homeState.filterModel.category,
                          onTap: (brand) {
                            homeController.setCategory(categoryList.firstWhere(
                                (element) => element.name == brand?.title));
                            homeController.updateFilter(homeState.filterModel
                                .copyWith(category: brand));
                          },
                        ),
                        SizedBox(
                          height: AppSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  ),

                  //Price Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSizes.lg,
                        ),
                        child: const BrandName(
                          brandName: AppTextString.priceRangeTitle,
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      RangeSlider(
                        values: _currentRangeValues,
                        min: 0,
                        max: 1750,
                        divisions: 175,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey[300],
                        labels: RangeLabels(
                          '\$${_currentRangeValues.start.round()}',
                          '\$${_currentRangeValues.end.round()}',
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${_currentRangeValues.start.round()}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              '\$${_currentRangeValues.end.round()}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),
                    ],
                  ),

                  //Sort By section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSizes.lg,
                        ),
                        child: const BrandName(
                          brandName: AppTextString.sortByTitle,
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: AppSizes.sm),
                          child: SizedBox(
                            height: 55.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sortByList.length,
                              itemBuilder: (context, index) {
                                final text = sortByList[index];

                                final isSelected =
                                    homeState.filterModel.sortBy == text;

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      homeController.updateFilter(homeState
                                          .filterModel
                                          .copyWith(sortBy: text));
                                    },
                                    child: IntrinsicWidth(
                                      stepWidth: 35.0,
                                      child: Center(
                                        child: Text(
                                          text,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      foregroundColor: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),
                    ],
                  ),

                  //Gender Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSizes.lg,
                        ),
                        child: const BrandName(
                          brandName: AppTextString.genderTitle,
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: AppSizes.sm),
                          child: SizedBox(
                            height: 55.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: genderSortList.length,
                              itemBuilder: (context, index) {
                                final text = genderSortList[index];

                                final isSelected =
                                    homeState.filterModel.gender == text;

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      homeController.updateFilter(homeState
                                          .filterModel
                                          .copyWith(gender: text));
                                    },
                                    child: IntrinsicWidth(
                                      stepWidth: 35.0,
                                      child: Center(
                                        child: Text(
                                          text,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      foregroundColor: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),
                    ],
                  ),

                  //Color Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSizes.lg,
                        ),
                        child: const BrandName(
                          brandName: AppTextString.colorTitle,
                        ),
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: AppSizes.sm),
                          child: ColorBtnList(
                            btnText: "Unisex",
                            itemCount: 3,
                            radius: 30.0,
                            onItemPressed: (int index) {},
                          )),
                      const SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FixedContainerWith2Buttons(
            button1Text: AppTextString.resetBtn + "(2)",
            button2Text: AppTextString.applyBtn,
            onPressedButton1: () {
              homeController.resetFilters();
            },
            onPressedButton2: () {
              if (homeState.filterModel.isAnyFilterApplied) {
                Navigator.of(context).pop(true);
              } else {
                Navigator.of(context).pop(false);
              }
            },
          ),
        ],
      ),
    );
  }
}
