import 'dart:math';

import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/model/funfact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunFactDialog extends StatefulWidget {
  const FunFactDialog({super.key});

  @override
  State<FunFactDialog> createState() => _FunFactDialogState();
}

class _FunFactDialogState extends State<FunFactDialog> {
  // Method to get a random fun fact
  String getRandomFact() {
    final random = Random();
    return Funfact_model[random.nextInt(Funfact_model.length)].description;
  }

  String _randomFact = ""; // Variable to hold the current random fact

  @override
  void initState() {
    super.initState();
    _randomFact = getRandomFact(); // Initialize with a random fact
  }

  // Method to refresh the fact
  void refreshFact() {
    setState(() {
      _randomFact = getRandomFact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make dialog fit content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Did you know?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.kprimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              _randomFact,
              style: AppTypography.kLight14,
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kprimary,
                      fixedSize: Size(180.w, 45.h)),
                  onPressed: refreshFact,
                  child: Text(
                    "Show Another fact",
                    style: AppTypography.kSemiBold14
                      ..copyWith(color: const Color.fromARGB(255, 197, 192, 192)),
                  )),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pop(context), // Close dialog
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kprimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
