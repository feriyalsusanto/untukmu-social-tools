part of '../home_page.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var xp = Random().nextInt(5000);
    var random = Random();

    // Generate 3 random splits, let the 4th be the remainder
    var xp1 = random.nextInt(xp + 1);
    var remaining1 = xp - xp1;

    var xp2 = remaining1 > 0 ? random.nextInt(remaining1 + 1) : 0;
    var remaining2 = remaining1 - xp2;

    var xp3 = remaining2 > 0 ? random.nextInt(remaining2 + 1) : 0;
    var xp4 = remaining2 - xp3;

    return Drawer(
      backgroundColor: Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(8, kToolbarHeight, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            Text(
              'XP & Badges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Card(
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
                  children: [
                    Text('Progress', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Level ${Random().nextInt(50)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: xp.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4B5563),
                            ),
                            children: [
                              TextSpan(
                                text: ' / 5000 XP',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: xp / 5000,
                      backgroundColor: Color(0xFFF5F5F5),
                      color: Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    SizedBox(height: 8),
                    progressItem(title: 'Posts', xp: xp1),
                    progressItem(title: 'Engagements', xp: xp2),
                    progressItem(title: 'Quests', xp: xp3),
                    progressItem(title: 'Connections', xp: xp4),
                  ],
                ),
              ),
            ),
            Card(
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
                  children: [
                    Text('Recent Badges', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF1F2937),
                                foregroundColor: Colors.white,
                                child: Icon(FontAwesomeIcons.rocket, size: 14),
                              ),
                              Text(
                                'Early Adopter',
                                style: TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 6,
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF1F2937),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.rocket),
                          Text('Mint Your Badge'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
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
                  children: [
                    Text('Active Quests', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 8),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFE5E7EB),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 8,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 8,
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Color(0xFF1F2937),
                                        child: Icon(
                                          FontAwesomeIcons.rocket,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Quest Title',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            '${Random().nextInt(5)}/5 completed',
                                            style: TextStyle(fontSize: 12),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1F2937),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Text(
                                      '+${Random().nextInt(1000)} XP',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              LinearProgressIndicator(
                                value: Random().nextInt(5) / 5,
                                backgroundColor: Color(0xFFF5F5F5),
                                color: Color(0xFF1F2937),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: 3,
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xFF1F2937),
                      ),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('View all quests'),
                          Icon(FontAwesomeIcons.arrowRight, size: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget progressItem({required String title, required int xp}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 12, color: Color(0xFF4B5563)),
          ),
        ),
        Text(
          xp.toString(),
          style: TextStyle(fontSize: 12, color: Color(0xFF4B5563)),
        ),
      ],
    );
  }
}
