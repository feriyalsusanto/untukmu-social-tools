part of '../home_passport_page.dart';

class ConnectedPlatformItem extends StatelessWidget {
  const ConnectedPlatformItem({
    super.key,
    required this.platformIcon,
    required this.platformName,
    this.platformUsername,
    this.isConnected = false,
    this.onTap,
    this.isLoading = false,
    this.connectDate,
  });

  final IconData platformIcon;
  final String platformName;
  final String? platformUsername;
  final bool isConnected;
  final Function()? onTap;
  final String? connectDate;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      borderOnForeground: true,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Row(
              spacing: 12,
              children: [
                Icon(platformIcon),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(platformName, style: TextStyle(fontSize: 16)),
                      if (isConnected && platformUsername != null)
                        Text(platformUsername!, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                if (isConnected)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      spacing: 4,
                      children: [
                        Icon(FontAwesomeIcons.check, size: 14),
                        Text('Active', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
              ],
            ),
            connectedButton(isLoading: isLoading, connectDate: connectDate),
          ],
        ),
      ),
    );
  }

  Widget connectedButton({bool isLoading = false, String? connectDate}) {
    if (isConnected) {
      return Text(
        'Connected since: $connectDate',
        style: TextStyle(fontSize: 15),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: Color(0xFF1F2937),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child:
              isLoading
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                      Text(
                        'Connecting...',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                  : Text('Connect', style: TextStyle(fontSize: 14)),
        ),
      );
    }
  }
}
