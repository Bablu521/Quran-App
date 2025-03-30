import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constant/route.dart';
import 'package:quran_app/cubits/ayat_cubit/ayat_cubit.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_cubit.dart';
import 'package:quran_app/cubits/suwar_cubit/suwar_cubit.dart';
import 'package:quran_app/screens/ayat_screen.dart';
import 'package:quran_app/screens/splash_screen.dart';
import 'package:quran_app/screens/suwar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SuwarCubit>(create: (context) => SuwarCubit()..getSuwar()),
        BlocProvider<AyatCubit>(create: (context) => AyatCubit()),
        BlocProvider<LastReadCubit>(create: (context) => LastReadCubit()),
      ],
      child: MaterialApp(
        routes: {
          AppRoute.suwarScreen: (context) => SuwarScreen(),
          AppRoute.ayatScreen: (context) => AyatScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
