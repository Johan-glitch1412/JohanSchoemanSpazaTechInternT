part of '../simple/simple_calc_cubit.dart';

@immutable
abstract class SimpleCalcState extends Equatable {
  @override
  List<Object> get props => [];
}

class SimpleCalcCalculated extends SimpleCalcState {
  SimpleCalcCalculated(this.values);

  final Map<String, num> values;

  @override
  List<Object> get props => [values];
}
