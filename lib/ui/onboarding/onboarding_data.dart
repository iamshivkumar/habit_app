

class OnboardingData {
  final String title;
  final List<String> description;
  final String image;
  final bool isSvg;
 const  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
     this.isSvg = true,
  });
}
