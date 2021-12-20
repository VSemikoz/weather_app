import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class StartUpBloc extends Bloc<StartUpEvent, StartUpState> {
  StartUpBloc() : super(StartUpState.first()) {
    on<StartUpEventToFirst>((event, emit) => toFirst(event, emit));
    on<StartUpEventToSecond>((event, emit) => toSecond(event, emit));
    on<StartUpEventtoThird>((event, emit) => toThird(event, emit));
  }

  toFirst(StartUpEventToFirst event, Emitter<StartUpState> emit) => emit(StartUpState.first());

  toSecond(StartUpEventToSecond event, Emitter<StartUpState> emit) => emit(StartUpState.second());

  toThird(StartUpEventtoThird event, Emitter<StartUpState> emit) => emit(StartUpState.third());
}
