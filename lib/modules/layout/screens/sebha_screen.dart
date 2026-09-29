import 'package:flutter/material.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  int _azkarIndex = 0;
  double _turns = 0.0;//متغير لحفظ قيمه الزاويه
  // قائمة الأذكار
  final List<String> _azkarList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  // دالة عند الضغط على السبحة
  void _onSebhaTap() {
    setState(() {
      _counter++;
      // زيادة الزاوية (دورة كاملة قُسمت على 33 ضغطة)
      _turns += 1 / 33;

      // عند الوصول إلى 33 تسبيحة يتم إعادة التصفير والتبديل
      if (_counter == 33) {
        _counter = 0;
        _azkarIndex = (_azkarIndex + 1) % _azkarList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/BackgroundSabha.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:
       SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 1. الشعار العلوي
              Image.asset(
                'assets/logo/home_logo.png',
                width: 220,
              ),

              const SizedBox(height: 20),

              // 2. الآية القرأنية
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
                style: TextStyle(
                  color: Color(0xFFE2BE7F),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              // منطقة الضغط والتفاعل
              GestureDetector(
                onTap: _onSebhaTap,
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //. جسم السبحة الدوار (مع أنيميشن حركة)
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: AnimatedRotation(
                        turns: _turns,
                        duration: const Duration(milliseconds: 300), // سرعة دوران السبحة
                        child: Image.asset(
                          'assets/images/SebhaBody.png',
                          width: 280,
                          height: 280,
                        ),
                      ),
                    ),


                    Positioned(
                      top: 0
                      ,
                      child: Image.asset(
                        'assets/images/Sabha_header.png',
                        width: 90,
                      ),
                    ),

                    // 3. النص والعداد في منتصف السبحة
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _azkarList[_azkarIndex],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$_counter',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}