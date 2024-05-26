import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constant/text_string.dart';
import '../../../../common/widget/button/elevated_with_icon.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../../../utils/routes/routes/route_constant.dart';

class FilterBtnWidget extends ConsumerWidget {
  const FilterBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final screenSize = AppHelperFunctions.screenSize(context);
    return Positioned(
      bottom: screenSize.height * 0.1,
      left: (screenSize.width - 120.0) / 2,
      child: ElevatedButtonWithIcon(
        btnText: AppTextString.filterBtn,
        icon: Icons.filter_list,
        buttonWidth: 130,
        isRoundBorder: true,
        onPressed: () {
          context.pushNamed(AppRouteConstant.filterRouteName);
        },
      ),
    );
  }
}
