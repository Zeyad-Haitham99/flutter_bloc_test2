import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test2/data/models/charachters.dart';
import 'package:flutter_bloc_test2/data/repositery/charachters_repositery.dart';
import 'package:meta/meta.dart';
part 'breakingbad_state.dart';

class BreakingbadCubit extends Cubit<BreakingbadState> {
  final CharachterRepositery charachterRepositery;
  List<Charachter> charachters = [];
  BreakingbadCubit(this.charachterRepositery) : super(BreakingbadInitial());

  List<Charachter> getallCharachters() {
    charachterRepositery.getAllCharachter().then((charachters) {
      emit(CharachterLoaded(charachters));
      this.charachters = charachters;
    });
    return charachters;
  }
}
