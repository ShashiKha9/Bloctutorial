import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(LatestCounterState(newCounterValue: 0)) {
    on<IncreaseCounterEvent>(onIncreaseCounterEvent);
    on<DecreaseCounterEvent>(onDecreaseCounterEvent);
  }
    void onIncreaseCounterEvent(IncreaseCounterEvent event,Emitter<CounterState>emit){
      int currentCounterValue= (state as LatestCounterState).newCounterValue;
      int newCounterValue= currentCounterValue + 1;
      emit(LatestCounterState(newCounterValue: newCounterValue));

    }
    void onDecreaseCounterEvent(DecreaseCounterEvent event,Emitter<CounterState>emit){
      int currentCounterValue= (state as LatestCounterState).newCounterValue;
      if(currentCounterValue ==0){
        return;
      }
      int newCounterValue= currentCounterValue - 1;

      emit(LatestCounterState(newCounterValue: newCounterValue));


    }







}
