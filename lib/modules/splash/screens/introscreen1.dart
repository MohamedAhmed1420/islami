import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../core/IntroData.dart';

class Introscreen1 extends StatefulWidget {
  const Introscreen1({super.key});

  @override
  State<Introscreen1> createState() => _Introscreen1State();
}

class _Introscreen1State extends State<Introscreen1> {
  final PageController _pageController = PageController(); // متغير للتحكم في الصورة
  int _currentPage = 0;

  //  قائمة البيانات (ضع مسارات الصور والنصوص الخاصة بكل صفحة)
  final List<IntroData> _introList = [
    IntroData(
      imagePath: 'assets/images/intro1.png',
      title: 'Welcome To Islmi App',
      subTitle: '',
  ),IntroData(
      imagePath: 'assets/images/intro2.png',
      title: 'Welcome To Islami',
      subTitle: 'We Are Very Excited To Have You In Our Community',
  ),IntroData(
      imagePath: 'assets/images/intro3.png',
      title: 'Reading the Quran',
      subTitle: 'Read, and your Lord is the Most Generous',
  ),IntroData(
      imagePath: 'assets/images/intro4.png',
      title: 'Bearish',
      subTitle: 'Praise the name of your Lord, the Most High',
  ),IntroData(
      imagePath: 'assets/images/intro5.png',
      title: 'Holy Quran Radio',
      subTitle: 'You can listen to the Holy Quran Radio through the application for free and easily',
  ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            //  الشعار اسلامي
            Image.asset(
              'assets/logo/home_logo.png',
              width: 250,
            ),

            // 2. الجزء المتغير (الصورة + النص)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _introList.length,
                itemBuilder: (context, index) {
                  final item = _introList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.imagePath,
                          height: 280,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),

                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        if (item.subTitle.isNotEmpty) ...[

                          Padding(
                            padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 39),
                            child: Text(
                              item.subTitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppColors.gold,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),

            // 3. أزرار التنقل السفلية
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر Back (يظهر بدءاً من الصفحة الثانية)
                  SizedBox(
                    width: 60,
                    child: _currentPage > 0
                        ? TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child:  Expanded(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: AppColors.gold,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                        : const SizedBox.shrink(),
                  ),

                  // مؤشرات النقاط (Indicators)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _introList.length,
                            (index) => buildDot(index),
                      ),
                    ),
                  ),

                  // زر Next / Finish
                  SizedBox(
                    width: 60,
                    child: TextButton(

                      onPressed: () {
                        if (_currentPage == _introList.length - 1) {

                          Navigator.pushReplacementNamed(context, '/LayoutScreen');
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Expanded(
                        child: Text(
                          _currentPage == _introList.length - 1 ?( 'Finish') : ('Next'),
                          style:  TextStyle(
                            color: AppColors.gold,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                            ,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 7,
      width: _currentPage == index ? 22 : 7,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color(0xFFE2BE7F)
            : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
