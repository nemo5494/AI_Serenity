import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_assets.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';

import 'package:aiserenity/views/landingpage/landingpage_view.dart';
import 'package:aiserenity/widget/button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double
              .infinity, //expand to take up as much available horizontal space as possible
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit
                      .fill, //stretched (both horizontally and vertically) to completely fill the available space
                  image: AssetImage(AppAssets.kwelcome))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 362.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.8)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Feel Better,\n  Think Clearer, \n Live Happier',
                  style: AppTypography.kSemiBold34
                      .copyWith(color: AppColors.kWhite),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  'Discover personalized mental  health support \n at your fingertips.',
                  style: AppTypography.kExtraLight14
                      .copyWith(color: AppColors.kwelcome),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Button(
                    text: 'Get Started',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingPage()));
                    })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
