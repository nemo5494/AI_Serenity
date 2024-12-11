import 'package:aiserenity/data/app_colors.dart';
import 'package:aiserenity/data/typography.dart';
import 'package:aiserenity/profile/profile.dart';
import 'package:aiserenity/views/Psychiatrist/PsychiatristList.dart';

import 'package:aiserenity/model/landingpageModel.dart';
import 'package:aiserenity/views/articles/ArticlesScreen.dart';
import 'package:aiserenity/views/landingpage/componenents/funfacts.dart';
import 'package:aiserenity/views/landingpage/componenents/landing_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

const link =
    "https://www.facebook.com/share/g/9Qgj1kJ4KVEPLBm5/?mibextid=A7sQZp";

class _LandingPageState extends State<LandingPage> {
  // Define unique actions for each button here
  void handleChatWithAI() {
    print("Navigating to AI Therapist chat...");
    // Add your navigation or other logic here
  }

  void handleConsultPsychiatrist() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PsychiatristListScreen()),
    );
  }

  void handleJoinCommunity() {
    launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
  }

  void handleViewArticles() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ArticlesScreen(),
      ),
    );
  }

  void showFunFactDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FunFactDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AiSerenity",
          style: AppTypography.kBold20.copyWith(color: AppColors.kWhite),
         
          
        ),
        backgroundColor: AppColors.kprimary,
        actions: [IconButton(onPressed: (){
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
        }, icon:  Icon(Icons.person_3,color: AppColors.kWhite,))],
      ),
      backgroundColor: AppColors.kgreycontainer,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 720.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: landingpage_model.length,
                itemBuilder: (context, index) {
                  final landing = landingpage_model[index];
                  // Assign different actions based on the index or model
                  VoidCallback buttonAction;
                  if (landing.title == "Chat with AI Therapist") {
                    buttonAction = handleChatWithAI;
                  } else if (landing.title == "Consult a Psychiatrist") {
                    buttonAction = handleConsultPsychiatrist;
                  } else if (landing.title == "Join the Community") {
                    buttonAction = handleJoinCommunity;
                  } else {
                    buttonAction = handleViewArticles;
                  }

                  return landingCard(
                    landing: landing,
                    onButtonPressed:
                        buttonAction, // Pass the unique button action
                  );
                },
              ),
            ),
            Divider(
              color: AppColors.kgreydivider,
              thickness: 1,
              height: 20.h,
            ),
            SizedBox(height: 10.h),

            //funfacts
            Row(
              children: [
                Image.asset(
                  'assets/images/funfact.png',
                  width: 150.w, // You can adjust the width and height as needed
                  height: 150.h,
                  fit: BoxFit.cover, // Adjust how the image fits within its box
                ),
                SizedBox(height: 10.w),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Want to know \nsome fun facts?",
                          style: AppTypography.kSemiBold14),
                      SizedBox(height: 9.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kprimary,
                            fixedSize: Size(150.w, 40.h)),
                        onPressed:
                            showFunFactDialog, // Show popup with fun fact
                        child: Text("Show Fun Facts",
                            style: AppTypography.kLight14
                              .copyWith(color: AppColors.kWhite)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
