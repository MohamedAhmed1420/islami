import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/hadeth_screen.dart';

import '../../../core/theme/app_colors.dart';

class HadethDetail extends StatelessWidget {
  final Hadeth hadeth;

  const HadethDetail({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        surfaceTintColor: AppColors.black,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(hadeth.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset("assets/images/img_left_corner.png"),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      hadeth.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset("assets/images/img_right_corner.png"),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  hadeth.body,
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 3,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
