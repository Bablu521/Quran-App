import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/ayat_cubit/ayat_state.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/network/api_service.dart';

class AyatCubit extends Cubit<AyatState> {
  final List<AyahModel> ayat = [];
  AyatCubit() : super(InitialState());

  getAyat({required String surahNumber}) async {
    emit(LoadingState());
    try {
      var json = await ApiService(
        dio: Dio(),
      ).getQuran(endPoint: '/surah/$surahNumber/ar.alafasy');
      AyahModel ayatModel = AyahModel.fromJson(json["data"]);
      ayat.clear();
      ayat.add(ayatModel);
      emit(SuccessState(ayat: ayat));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
