import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_state.dart';

class LastReadCubit extends Cubit <LastReadState> {
  LastReadCubit() : super(InitialState());

  getLastRead ({required String lastReadSurah , required int lastReadAyah }) {
    emit(SuccessState(lastReadSurah: lastReadSurah, lastReadAyah: lastReadAyah));
  }
}