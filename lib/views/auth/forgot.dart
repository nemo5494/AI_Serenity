import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_assets.dart';

import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/widget/button.dart';

import 'components/auth_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 29.w, right: 29.w, top: 19.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot\nPassword',
              style: AppTypography.kBold36.copyWith(color: AppColors.kblack),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 32.h,
            ),
            AuthField(
              controller: _emailController,
              hintText: 'Enter your email address',
              icon: AppAssets.kmail,
            ),
            SizedBox(
              height: 26.h,
            ),
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: '*',
                    style: AppTypography.kLight12
                        .copyWith(color: AppColors.kprimary)),
                TextSpan(
                    text:
                        'We will send you a message to set or reset\nyour new password',
                    style: AppTypography.kLight12
                        .copyWith(color: AppColors.kgreyregister)),
              ]),
            ),
            SizedBox(
              height: 26.h,
            ),
            Button(text: 'Submit', ontap: () {}),
          ],
        ),
      )),
    );
  }
}
