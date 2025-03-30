import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_cubit.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_state.dart';
import 'package:quran_app/widgets/suwar_sliverlist.dart';

class SuwarScreen extends StatelessWidget {
  const SuwarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quran App",
              style: TextStyle(
                color: Color(0xff8957c1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Padding(
              padding: EdgeInsets.only(top: 9),
              child: Image(
                image: AssetImage("images/icon_quran_white.png"),
                width: 32,
                height: 32,
                color: Color(0xff8957c1),
              ),
            ),
          ],
        ),
        // leading: Icon(Icons.menu, color: Color(0xff9190a1), size: 28),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search, color: Color(0xff9190a1), size: 28),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/alquran.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: BlocBuilder<LastReadCubit, LastReadState>(
                    builder: (context, state) {
                      String lastReadSurah = "سُورَةُ ٱلْفَاتِحَةِ"; // Default
                      int lastReadAyah = 1; // Default
                      if (state is SuccessState){
                        lastReadSurah = state.lastReadSurah;
                        lastReadAyah = state.lastReadAyah;
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/icon_readme.png"))
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Last Read",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                lastReadSurah,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Ayah No: $lastReadAyah",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          SuwarSliverlist(),
        ],
      ),
    );
  }
}
