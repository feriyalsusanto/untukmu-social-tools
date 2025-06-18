import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class ConnectInformation extends StatelessWidget {
  const ConnectInformation({
    super.key,
    required this.description,
    required this.assetName,
  });

  final String description;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DLSSizing.s2xSmall),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(assetName, width: 16, height: 16),
          Expanded(
            child: Text(
              description,
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: DLSColors.textSoft400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
