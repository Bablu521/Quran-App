class AyahModel {
  final String surahName;
  final int surahNumber;
  final String englishName;
  final String revelationType;
  final int numberOfAyahs;
  final List<Ayah> ayahs;

  const AyahModel({
    required this.surahName,
    required this.surahNumber,
    required this.englishName,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs,
  });

  factory AyahModel.fromJson(json) {
    return AyahModel(
      surahName: json["name"],
      surahNumber: json["number"],
      englishName: json["englishName"],
      revelationType: json["revelationType"],
      numberOfAyahs: json["numberOfAyahs"],
      ayahs:
          (json["ayahs"] as List).map((ayah) => Ayah.fromJson(ayah)).toList(),
    );
  }
}

class Ayah {
  final String text;
  final int numberInQuran;
  final String audio;
  final int numberInSurah;

  Ayah({
    required this.text,
    required this.numberInQuran,
    required this.audio,
    required this.numberInSurah,
  });

  factory Ayah.fromJson(json) {
    return Ayah(
      text: json["text"],
      numberInQuran: json["number"],
      audio: json["audio"],
      numberInSurah: json["numberInSurah"],
    );
  }
}
