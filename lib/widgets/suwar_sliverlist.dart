import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/suwar_cubit/suwar_cubit.dart';
import 'package:quran_app/cubits/suwar_cubit/suwar_state.dart';
import 'package:quran_app/widgets/suwar_item.dart';

class SuwarSliverlist extends StatelessWidget {
  const SuwarSliverlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuwarCubit, SuwarState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    return SuwarItem(surah: state.suwar[index]);
                  },
                  itemCount: state.suwar.length,
                );
              } else if (state is ErrorState) {
                return SliverToBoxAdapter(
                  child: Text("Error: ${state.errorMessage}"),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
  }
}