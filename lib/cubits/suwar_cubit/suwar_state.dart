import 'package:quran_app/model/surah_model.dart';

abstract class SuwarState {}

class InitialState extends SuwarState {}

class LoadingState extends SuwarState {}

class SuccessState extends SuwarState {
  final List<SurahModel> suwar;
  SuccessState({required this.suwar});
}

class ErrorState extends SuwarState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}
