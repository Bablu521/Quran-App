abstract class LastReadState {}

class InitialState extends LastReadState {}

class SuccessState extends LastReadState {
  final String lastReadSurah;
  final int lastReadAyah;
  SuccessState({required this.lastReadSurah,required this.lastReadAyah});
}
