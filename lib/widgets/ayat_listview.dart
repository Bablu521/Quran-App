import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/widgets/ayat_item.dart';

class AyatListView extends StatelessWidget {
  final List<Ayah> ayat;
  final String lastReadSurah;
  final int? playingIndex;
  final AudioPlayer player;
  final Function(int) onAyahTap;
  const AyatListView({
    super.key,
    required this.ayat,
    required this.lastReadSurah,
    required this.playingIndex,
    required this.player,
    required this.onAyahTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (contxt, index) {
        return AyatItem(
          lastReadSurah: lastReadSurah,
          ayahNumber: ayat[index].numberInSurah,
          ayahText: ayat[index].text,
          ayahAudio: ayat[index].audio,
          index: index,
          playingIndex: playingIndex,
          player: player,
          onAyahTap: () => onAyahTap(index)
        );
      },
      itemCount: ayat.length,
    );
  }
}

