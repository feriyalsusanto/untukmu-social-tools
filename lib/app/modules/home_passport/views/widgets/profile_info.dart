part of '../home_passport_page.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://picsum.photos/300/300',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '@creativecoder',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    FontAwesomeIcons.locationDot,
                    size: 18,
                    color: Color(0xFF4B5563),
                  ),
                  Text(
                    'Jakarta, Indonesia',
                    style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  'DRX Yield Farmer & Urban Explorer',
                  style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
