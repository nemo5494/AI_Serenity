import 'package:aiserenity/views/auth/signin.dart';
import 'package:aiserenity/widget/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_assets.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/views/auth/components/auth_field.dart';
import 'package:aiserenity/views/welcome/welcome_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
          body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 63.h, left: 29.w, right: 29.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create an \naccount', style: AppTypography.kBold36),
            SizedBox(
              height: 33.0.h,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthField(
                        controller: _emailController,
                        hintText: 'Username or Email',
                        icon: AppAssets.kuser),
                    SizedBox(
                      height: 31.h,
                    ),
                    AuthField(
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Password',
                        icon: AppAssets.klock),
                    SizedBox(
                      height: 31.h,
                    ),
                    AuthField(
                        controller: _confirmPasswordController,
                        isPassword: true,
                        hintText: 'Confirm Password',
                        icon: AppAssets.klock),
                  ],
                )),
            SizedBox(
              height: 19.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.0.w),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By clicking the ',
                      style: AppTypography.kExtraLight12
                          .copyWith(color: AppColors.kGreyHint),
                    ),
                    TextSpan(
                      text: 'Register ',
                      style: AppTypography.kExtraLight12.copyWith(
                        color: AppColors.kprimary,
                      ),
                    ),
                    TextSpan(
                      text: 'button, you agree \nto the public offer',
                      style: AppTypography.kExtraLight12
                          .copyWith(color: AppColors.kdarkgrey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 38.h),
            Button(
                ontap: () {
                  {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcome()),
                      );
                    }
                  }
                },
                text: 'Create Account'),
            SizedBox(height: 40.h),
            Center(
              child: Text('- OR Continue with -',
                  style: AppTypography.kLight12
                      .copyWith(color: AppColors.kdarkgrey)),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(AppAssets.kgooglelogo)),
                SizedBox(
                  width: 10.w,
                ),
                Image(image: AssetImage(AppAssets.kapplelogo)),
                SizedBox(
                  width: 10.w,
                ),
                Image(image: AssetImage(AppAssets.kfacebooklogo)),
              ],
            ),
            SizedBox(height: 30.h),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'I Already Have an Account',
                      style: AppTypography.kExtraLight14
                          .copyWith(color: AppColors.kdarkgrey),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Login',
                      style: AppTypography.kSemiBold14.copyWith(
                        color: AppColors.kprimary,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
