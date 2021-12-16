part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class LatestCounterState extends CounterState {
  final int newCounterValue;

  LatestCounterState({required this.newCounterValue});

  @override
  List<Object> get props => [newCounterValue];
}
