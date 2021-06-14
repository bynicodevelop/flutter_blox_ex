import 'dart:async';

import 'package:app_state_mamagment/repositories/abstracts/inc_respository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  final IncRepository _incRepository;

  IncrementBloc(this._incRepository) : super(IncrementInitialState());

  @override
  Stream<IncrementState> mapEventToState(
    IncrementEvent event,
  ) async* {
    if (event is IncrementInitialEvent) {
      yield IncrementInitialState();
    } else if (event is IncrementAddEvent) {
      _incRepository.increment();

      yield IncrementInitialState(
        inc: _incRepository.inc,
      );
    }
  }
}
