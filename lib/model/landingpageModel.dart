import 'package:aiserenity/data/app_assets.dart';

class LandingModel {
  String title;
  String description;
  String image;
  String buttonText;
  LandingModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.buttonText});
}

List<LandingModel> landingpage_model = [
  LandingModel(
      title: "Chat with AI Therapist",
      description: "For quick, AI-driven \nmental health support",
      image: AppAssets.kAi,
      buttonText: "Start Chat"),
  LandingModel(
      title: "Consult a Psychiatrist",
      description:
          "Connect with a professional \nfor personalized care",
      image: AppAssets.kpsychatristlogo,
      buttonText: "Book Appointment"),
  LandingModel(
      title: "Join the Community",
      description:
          "Engage with others, share \nexperiences, and offer support.",
      image: AppAssets.kcommunity,
      buttonText: "Join Now"),
  LandingModel(
      title: "View Mental Health \nArticles",
      description: "Browse helpful articles \nabout mental health",
      image: AppAssets.kcommunity,
      buttonText: "View Articles")
];
