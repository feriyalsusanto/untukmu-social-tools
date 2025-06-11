part of '../home_passport_page.dart';

class SocialMediaList extends StatelessWidget {
  const SocialMediaList({super.key, required this.socialMediaButtons});

  final List<SocialMediaButton> socialMediaButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return socialMediaButtons[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        itemCount: socialMediaButtons.length,
      ),
    );
  }
}
