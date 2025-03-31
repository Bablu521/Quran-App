import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_state.dart';

class LastReadCubit extends Cubit<LastReadState> {
  LastReadCubit() : super(InitialState()) {
    loadLastRead();
  }

  Future<void> getLastRead({required String lastReadSurah, required int lastReadAyah}) async {
    emit(SuccessState(lastReadSurah: lastReadSurah, lastReadAyah: lastReadAyah));
    await saveLastRead(lastReadSurah, lastReadAyah);
  }

  Future<void> saveLastRead(String lastReadSurah, int lastReadAyah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastReadSurah", lastReadSurah);
    await prefs.setInt("lastReadAyah", lastReadAyah);
  }

  Future<void> loadLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    String lastReadSurah = prefs.getString("lastReadSurah") ?? "سُورَةُ ٱلْفَاتِحَةِ";
    int lastReadAyah = prefs.getInt("lastReadAyah") ?? 1;
    emit(SuccessState(lastReadSurah: lastReadSurah, lastReadAyah: lastReadAyah));
  }
}
