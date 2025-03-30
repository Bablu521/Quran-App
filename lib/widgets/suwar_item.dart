import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constant/route.dart';
import 'package:quran_app/cubits/ayat_cubit/ayat_cubit.dart';
import 'package:quran_app/model/surah_model.dart';

class SuwarItem extends StatelessWidget {
  final SurahModel surah;
  const SuwarItem({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.ayatScreen , arguments: {"surahName" : surah.name });
        final AyatCubit cubit = BlocProvider.of<AyatCubit>(context);
        cubit.getAyat(surahNumber: surah.number.toString());
      },
      child: Padding(
        padding: EdgeInsets.only(top: 12.5, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/icon_no.png"),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      surah.number.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c1442),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surah.englishName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1c1442),
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                surah.revelationType,
                                style: TextStyle(color: Color(0xff9190a1)),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "|",
                                style: TextStyle(color: Color(0xff9190a1)),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "${surah.numberOfAyahs.toString()} Verses",
                                style: TextStyle(color: Color(0xff9190a1)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        surah.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "NotoKufi",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8957c1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 12.5),
              child: Divider(thickness: 1, color: Color(0xff9190a1)),
            ),
          ],
        ),
      ),
    );
  }
}
