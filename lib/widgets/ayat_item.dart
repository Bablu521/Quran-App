import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_cubit.dart';

class AyatItem extends StatelessWidget {
  final String lastReadSurah;
  final int ayahNumber;
  final String ayahText;
  final String ayahAudio;
  final int index;
  final int? playingIndex;
  final AudioPlayer player;
  final VoidCallback onAyahTap;

  const AyatItem({
    super.key,
    required this.lastReadSurah,
    required this.ayahNumber,
    required this.ayahText,
    required this.ayahAudio,
    required this.index,
    required this.playingIndex,
    required this.player,
    required this.onAyahTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAyahTap();
        final LastReadCubit cubit = BlocProvider.of<LastReadCubit>(context);
        cubit.getLastRead(
          lastReadSurah: lastReadSurah,
          lastReadAyah: ayahNumber,
        );
        player.play(UrlSource(ayahAudio));
      },
      child: Container(
        color:
            playingIndex == index 
                ? const Color.fromARGB(255, 250, 226, 197)
                : Colors.white,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$ayahText ",
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: "NotoKufi",
                  color: Color(0xff1c1442),
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/icon_no.png"),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "$ayahNumber",
                      style: const TextStyle(color: Color(0xff1c1442)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
