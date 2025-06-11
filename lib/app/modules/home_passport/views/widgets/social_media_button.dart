part of '../home_passport_page.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.icon,
    this.isConnected = false,
    this.isConnectMore = false,
    this.onTap,
  });

  final Function()? onTap;
  final IconData icon;
  final bool isConnected;
  final bool isConnectMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          spacing: 4,
          children: [
            Icon(icon, size: 16),
            Text(
              isConnectMore
                  ? 'Connect More'
                  : isConnected
                  ? 'Connected'
                  : 'Connect',
            ),
          ],
        ),
      ),
    );
  }
}
