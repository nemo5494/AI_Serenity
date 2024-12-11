class OnboardingModel {
  String text;
  String description;
  String image;
  OnboardingModel(
      {required this.text, required this.description, required this.image});
}

List<OnboardingModel> onboardingmodel = [
  OnboardingModel(
      text: 'Your Personal Mental Health Companion',
      description:
          ' AI Serenity combines the power of AI and human expertise to support your mental well-being anytime, anywhere',
      image: 'assets/images/slide1.png'),
  OnboardingModel(
      text: 'AI Guidance, Real Human Care',
      description:
          'Our AI provides instant insights, while licensed psychiatrists are available to guide you through deeper, personalized conversations.',
      image: 'assets/images/slide2.png'),
  OnboardingModel(
      text: 'Confidential and Secure',
      description:
          'Your privacy is our top priority. All your sessions are confidential and encrypted to ensure your peace of mind.',
      image: 'assets/images/slide3.png'),
];
