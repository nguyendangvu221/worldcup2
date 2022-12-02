import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_cup/src/bloc/worldcup_state.dart';

class WorldCupCuBit extends Cubit<WorldCupState> {
  WorldCupCuBit() : super(InitWorldCupState());

  Future<void> fetchWorldCup() async {
    emit(LoadingWorldCupState());
  }
}
