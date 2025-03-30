import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/suwar_cubit/suwar_state.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/network/api_service.dart';

class SuwarCubit extends Cubit<SuwarState> {
  final List <SurahModel> suwar = [];
  SuwarCubit() : super(InitialState());

  getSuwar() async {
    emit(LoadingState());
    try {
      var json = await ApiService(dio: Dio()).getQuran(endPoint:'/surah');
      for (var item in json["data"]) {
        suwar.add(SurahModel.fromJson(item));
      }
      emit(SuccessState(suwar: suwar));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
