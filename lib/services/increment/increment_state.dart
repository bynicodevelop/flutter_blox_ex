part of 'increment_bloc.dart';

abstract class IncrementState extends Equatable {
  const IncrementState();

  @override
  List<Object> get props => [];
}

class IncrementInitialState extends IncrementState {
  final int inc;

  const IncrementInitialState({
    this.inc = 0,
  });

  @override
  List<Object> get props => [inc];
}
