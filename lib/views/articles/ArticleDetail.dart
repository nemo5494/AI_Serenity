import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;

  final String content;
  final String author; // New field for the author

  const ArticleDetailScreen({
    super.key,
    required this.title,
    required this.content,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.kprimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.h.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(title,
                  style: AppTypography.kBold20, textAlign: TextAlign.center),
              SizedBox(height: 8.h),
              Text('By $author', // Display the author
                  style: AppTypography.kSemiBold16),
              SizedBox(height: 16.h),
              Text(content, // Display full article content
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.justify),
            ],
          ),
        ),
      ),
    );
  }
}
