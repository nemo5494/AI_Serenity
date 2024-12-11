import 'package:aiserenity/model/onboarding_models.dart';
import 'package:aiserenity/views/auth/signin.dart';
import 'package:aiserenity/views/onboarding/components/obboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbaording extends StatefulWidget {
  const Onbaording({super.key});

  @override
  State<Onbaording> createState() => _OnbaordingState();
}

class _OnbaordingState extends State<Onbaording> {
  final PageController _pageController = PageController(initialPage: 0);
  var currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: RichText(
            text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: '${currentpage + 1}',
              style:
                  AppTypography.kSemiBold18.copyWith(color: AppColors.kblack)),
          TextSpan(
              text: '/3',
              style: AppTypography.kSemiBold18
                  .copyWith(color: AppColors.kGreyborder))
        ])),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SignIn())));
                },
                child: Text(
                  'Skip',
                  style: AppTypography.kSemiBold18
                      .copyWith(color: AppColors.kblack),
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentpage = index;
                  });
                },
                itemCount: onboardingmodel.length,
                itemBuilder: (context, index) {
                  return OnboardingCard(
                    onboarding: onboardingmodel[index],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceOut);
                  },
                  child: currentpage == 0
                      ? const Text('')
                      : Text(
                          'Prev',
                          style: AppTypography.kSemiBold18
                              .copyWith(color: AppColors.kGreyprev),
                        )),
              SmoothPageIndicator(
                controller: _pageController,
                count: onboardingmodel.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 10.h,
                    dotWidth: 10.w,
                    radius: 100.r,
                    activeDotColor: AppColors.kblack),
              ),
              TextButton(
                  onPressed: () {
                    currentpage == 2
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignIn())))
                        : _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceOut);
                  },
                  child: currentpage == 2
                      ? Text(
                          'Get Started',
                          style: AppTypography.kSemiBold18
                              .copyWith(color: AppColors.kprimary),
                        )
                      : Text(
                          'Next',
                          style: AppTypography.kSemiBold18
                              .copyWith(color: AppColors.kprimary),
                        )),
            ],
          )
        ],
      ),
    );
  }
}
