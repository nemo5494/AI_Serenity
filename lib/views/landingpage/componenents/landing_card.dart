import 'package:aiserenity/model/landingpageModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';

class landingCard extends StatelessWidget {
  final LandingModel landing;
  final VoidCallback onButtonPressed;
  const landingCard(
      {super.key, required this.landing, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10.h), // Add vertical spacing between cards
      padding: EdgeInsets.all(12.w), // padding inside the container
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2), // Slight shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                landing.title,
                style: AppTypography.kBold16,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5.h),
              Text(landing.description,
                  style: AppTypography.kSemiBold14
                      .copyWith(color: AppColors.kGreyborder),
                  textAlign: TextAlign.start),
              SizedBox(height: 10.h),
              //button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kprimary,
                      fixedSize: Size(180.w, 50.h)),
                  onPressed: onButtonPressed,
                  child: Text(
                    landing.buttonText,
                    style:
                        AppTypography.kSemiBold16.copyWith(color: Colors.white),
                  )),
            ],
          ),
          const Spacer(),
          SizedBox(width: 10.w),
          SizedBox(
            width: 40.w,
            height: 50.h,
            child: Image.asset(
              landing.image,
              fit: BoxFit.cover, //  the image fits within the box
            ),
          ),
        ],
      ),
    );
  }
}
