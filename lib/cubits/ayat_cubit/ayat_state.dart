import 'package:quran_app/model/ayah_model.dart';

abstract class AyatState {}

class InitialState extends AyatState {}

class LoadingState extends AyatState {}

class SuccessState extends AyatState {
  final List <AyahModel> ayat;
  SuccessState({required this.ayat});
}

class ErrorState extends AyatState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}
