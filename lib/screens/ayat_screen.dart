import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/ayat_cubit/ayat_cubit.dart';
import 'package:quran_app/cubits/ayat_cubit/ayat_state.dart';
import 'package:quran_app/widgets/ayat_listview.dart';

class AyatScreen extends StatefulWidget {
  const AyatScreen({super.key});

  @override
  State<AyatScreen> createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  int? playingIndex;
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String surahName = data["surahName"];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            player.stop();
            Navigator.maybePop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xff9190a1)),
        ),
        title: Text(
          surahName,
          style: TextStyle(
            fontSize: 22,
            fontFamily: "NotoKufi",
            fontWeight: FontWeight.bold,
            color: Color(0xff8957c1),
          ),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<AyatCubit, AyatState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: AyatListView(
                  ayat: state.ayat[0].ayahs,
                  lastReadSurah: state.ayat[0].surahName,
                  playingIndex: playingIndex,
                  player: player,
                  onAyahTap: (index) {
                    setState(() {
                      playingIndex = index;
                    });
                  },
                ),
              );
            } else if (state is ErrorState) {
              return Text("Error: ${state.errorMessage}");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
