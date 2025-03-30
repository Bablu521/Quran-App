class SurahModel {
  final String name;
  final int number;
  final String englishName;
  final String revelationType;
  final int numberOfAyahs;

  const SurahModel({
    required this.name,
    required this.number,
    required this.englishName,
    required this.revelationType,
    required this.numberOfAyahs,
  });

  factory SurahModel.fromJson(json) {
    return SurahModel(
      name:json["name"],
      number: json["number"],
      englishName: json["englishName"],
      revelationType: json["revelationType"],
      numberOfAyahs: json["numberOfAyahs"],
    );
  }
}
