part of 'breakingbad_cubit.dart';

@immutable
abstract class BreakingbadState {}

class BreakingbadInitial extends BreakingbadState {}

class CharachterLoaded extends BreakingbadState {
  final List<Charachter> loadedCharachter;

  CharachterLoaded(this.loadedCharachter);
}
