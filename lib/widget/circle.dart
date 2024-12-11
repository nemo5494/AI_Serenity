import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_colors.dart';

class KCircle extends StatelessWidget {
  const KCircle({required this.image, super.key});
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.w,
      height: 54.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.klightpink,
        border: Border.all(width: 1.w, color: AppColors.kprimary),
      ),
      child: Center(child: image),
    );
  }
}
