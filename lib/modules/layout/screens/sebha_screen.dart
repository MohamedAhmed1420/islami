import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  int _azkarIndex = 0;
  double _turns = 0.0; // Keeps track of rotation angle

  // List of Azkar
  final List<String> _azkarList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  // Tap handler for the Sebha
  void _onSebhaTap() {
    setState(() {
      _counter++;
      // Increment rotation angle (one full circle divided across 33 taps)
      _turns += 1 / 33;

      // When reaching 33, reset counter and switch to the next Zikr
      if (_counter == 33) {
        _counter = 0;
        _azkarIndex = (_azkarIndex + 1) % _azkarList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/BackgroundSabha.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 1. Top Logo
              Image.asset(
                'assets/logo/home_logo.png',
                width: 220,
              ),

              const SizedBox(height: 20),

              // 2. Quranic Verse Header
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
                style: TextStyle(
                  color: Color(0xFFE2BE7F),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              // Interactive Sebha Area
              GestureDetector(
                onTap: _onSebhaTap,
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Rotating Sebha Body with faster animation duration
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: AnimatedRotation(
                        turns: _turns,
                        duration: const Duration(milliseconds: 150), // Snappier response
                        child: Image.asset(
                          'assets/images/SebhaBody.png',
                          width: 280,
                          height: 280,
                        ),
                      ),
                    ),

                    // Sebha Header Pin / Top Piece
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'assets/images/Sabha_header.png',
                        width: 90,
                      ),
                    ),

                    // 3. Zikr Text and Counter in the Center
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