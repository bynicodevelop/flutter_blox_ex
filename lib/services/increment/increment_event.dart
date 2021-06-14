part of 'increment_bloc.dart';

abstract class IncrementEvent extends Equatable {
  const IncrementEvent();

  @override
  List<Object> get props => [];
}

class IncrementInitialEvent extends IncrementEvent {}

class IncrementAddEvent extends IncrementEvent {}
