part of '../home_passport_page.dart';

class ImpactScoreBreakdown extends StatelessWidget {
  const ImpactScoreBreakdown({super.key, required this.impactScoreBreakdown});

  final List<Map<String, dynamic>> impactScoreBreakdown;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Impact Score Breakdown',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 1, color: Color(0xFFE5E7EB)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            impactScoreBreakdown[index]['title'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFFF3F4F6),
                            child: Icon(
                              impactScoreBreakdown[index]['icon'],
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        impactScoreBreakdown[index]['value'].toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        impactScoreBreakdown[index]['detail'].toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: impactScoreBreakdown.length,
            ),
          ),
        ],
      ),
    );
  }
}
