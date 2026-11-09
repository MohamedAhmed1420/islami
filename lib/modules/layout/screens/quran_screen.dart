import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/sura_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../sura_details/screens/quran_details_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<SuraModel> suraSearchList = [];
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black.withValues(alpha: 0.7),
                    AppColors.black,
                  ],
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset("assets/logo/home_logo.png", width: 300),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.white),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            isSearch=true;
                          } else {isSearch=false;}
                          suraSearch(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SvgPicture.asset(
                              "assets/icons/ic_quran.svg",
                              color: AppColors.gold,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.gold),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.gold),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.gold),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.white,
                            endIndent: 50,
                            indent: 50,
                            height: 24,
                          );
                        },
                        padding: EdgeInsets.all(8),
                        itemCount:!isSearch? SuraModel.getAllSura().length:suraSearchList.length,

                        itemBuilder: (context, index) {
                          var sura =!isSearch? SuraModel.getAllSura()[index]:suraSearchList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return QuranDetailsScreen(sura: sura);
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Stack(
                                  alignment: AlignmentGeometry.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/img_sur_number_frame.png",
                                      width: 55,
                                      height: 55,
                                    ),
                                    Text(
                                      (sura.id + 1).toString(),
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      sura.nameEn,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "${sura.ayaNumber} Verses",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  sura.nameAr,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void suraSearch(String q) {
    suraSearchList.clear();
    for (var e in SuraModel.getAllSura()) {
      if (e.nameAr.contains(q) || e.nameEn.contains(q)) {
        suraSearchList.add(e);
      }
    }
    setState(() {});
  }
}
