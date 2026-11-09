import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadeth = [];

  @override
  void initState() {
    super.initState(); // 1. super.initState() must be called first
    readFiles(); // 2. Call readFiles here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadith_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/logo/home_logo.png", width: 290),
              SizedBox(height: 55),
              Expanded(
                child: ahadeth.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: AppColors.gold),
                      ) // Show a loader while files load asynchronously
                    : CarouselSlider.builder(
                        itemCount: ahadeth.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.gold,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/images/img_left_corner.png",
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            ahadeth[index].title,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          "assets/images/img_right_corner.png",
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // 3. Fixed Stack layout (replaced Expanded with Positioned.fill)
                                      Positioned.fill(
                                        child: Image.asset(
                                          "assets/images/HadithCardBackGround.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            ahadeth[index].body,
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/Mosque-02.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: double.infinity,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void readFiles() async {
    for (int i = 1; i <= 50; i++) {
      var data = await rootBundle.loadString("assets/Hadeth/h$i.txt");

      data.trim();

      var title = data.split("\n")[0].trim();

      var body = data.split("\n")[1].trim();

      ahadeth.add(Hadeth(title: title, body: body));
    }
    setState(() {});
  }
}

// 4. Trigger setState so the UI rebuilds once all files are loaded

class Hadeth {
  String title;
  String body;

  Hadeth({required this.title, required this.body});
}
