import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/widgets/custom_text_field.dart';
import 'package:news_app/styling/app_colors.dart';

class SearchTextfieldWidget extends StatefulWidget {
  const SearchTextfieldWidget({super.key});

  @override
  State<SearchTextfieldWidget> createState() => _SearchTextfieldWidgetState();
}

class _SearchTextfieldWidgetState extends State<SearchTextfieldWidget> {
  bool showTextField = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) => SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: showTextField
              ? Padding(
                  key: const ValueKey('search-field'),
                  padding: EdgeInsets.only(right: 8.w),
                  child: CustomTextField(
                    hintText: "search".tr(),
                    width: 200.w,
                    obscureText: false,
                    onSubmitted: (value) {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoutes.searchResultScreen, extra: value);
                    },
                  ),
                )
              : const SizedBox(key: ValueKey('search-empty')),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          icon: const Icon(Icons.search, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
