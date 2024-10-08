import 'package:aiserenity/views/auth/signup.dart';
import 'package:aiserenity/widget/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_assets.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/views/auth/components/auth_field.dart';
import 'package:aiserenity/views/auth/forgot.dart';

import 'package:aiserenity/views/welcome/welcome_view.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
          body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 63.h, left: 26.w, right: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome\nBack!', style: AppTypography.kBold36),
            SizedBox(height: 36.0.h),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthField(
                        controller: _emailController,
                        hintText: 'Username or Email',
                        icon: AppAssets.kuser),
                    SizedBox(height: 30.h),
                    AuthField(
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Password',
                        icon: AppAssets.klock),
                  ],
                )),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTypography.kLight12
                        .copyWith(color: AppColors.kprimary),
                  )),
            ),
            SizedBox(height: 52.h),
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
                text: 'Login'),
            SizedBox(height: 75.h),
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
                      text: 'Create An Account',
                      style: AppTypography.kExtraLight14
                          .copyWith(color: AppColors.kdarkgrey),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Sign Up',
                      style: AppTypography.kSemiBold14.copyWith(
                        color: AppColors.kprimary,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
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
