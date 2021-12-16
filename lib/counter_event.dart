part of 'counter_bloc.dart';


abstract class CounterEvent extends Equatable {
  const CounterEvent();
}
class DecreaseCounterEvent extends CounterEvent{
  @override
  List<Object>get props=>[];


}

class IncreaseCounterEvent extends CounterEvent{
  @override
  List<Object>get props=>[];


}

