import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/model/onboarding_models.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingModel onboarding;
  const OnboardingCard({super.key, required this.onboarding});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboarding.image),
        SizedBox(height: 15.h),
        Text(
          onboarding.text,
          style: AppTypography.kExtraBold24,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(onboarding.description,
            style: AppTypography.kSemiBold14
                .copyWith(color: AppColors.kGreyborder),
            textAlign: TextAlign.center),
      ],
    );
  }
}
