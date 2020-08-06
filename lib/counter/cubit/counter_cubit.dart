import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<Breakdown> {
  CounterCubit() : super(Breakdown({'0': 0}));

  void calculate(double cost, double tender) {
    double _change = tender - cost;
    int remainder = 0;
    Map<String, int> breakdownEmit = new Map();

    if (_change < 0) {
      Breakdown breakdown = Breakdown({'insufficient funds': 1});
      emit(breakdown);
    } else {
      if (_change >= 200) {
        remainder = (_change / 200).floor();
        _change -= (200 * remainder);
        breakdownEmit['R200'] = remainder;
      }
      if (_change >= 100) {
        remainder = (_change / 100).floor();
        _change -= (100 * remainder);
        breakdownEmit['R100'] = remainder;
      }
      if (_change >= 50) {
        remainder = (_change / 50).floor();
        _change -= (50 * remainder);
        breakdownEmit['R50'] = remainder;
      }
      if (_change >= 20) {
        remainder = (_change / 20).floor();
        _change -= (20 * remainder);
        breakdownEmit['R20'] = remainder;
      }
      if (_change >= 10) {
        remainder = (_change / 10).floor();
        _change -= (10 * remainder);
        breakdownEmit['R10'] = remainder;
      }
      if (_change >= 5) {
        remainder = (_change / 5).floor();
        _change -= (5 * remainder);
        breakdownEmit['R5'] = remainder;
      }
      if (_change >= 2) {
        remainder = (_change / 2).floor();
        _change -= (2 * remainder);
        breakdownEmit['R2'] = remainder;
      }
      if (_change >= 1) {
        remainder = (_change / 1).floor();
        _change -= (1 * remainder);
        breakdownEmit['R1'] = remainder;
      }
      if (_change >= 0.50) {
        remainder = (_change / 0.50).floor();
        _change -= (0.50 * remainder);
        breakdownEmit['R0.50'] = remainder;
      }
      if (_change >= 0.20) {
        remainder = (_change / 0.20).floor();
        _change -= (0.20 * remainder);
        breakdownEmit['R0.20'] = remainder;
      }

      Breakdown breakdown = Breakdown(breakdownEmit);
      emit(breakdown);
      print(breakdown.breakdown);
    }
  }

  void invalidType(String error) {
    Breakdown breakdown = Breakdown({error: 1});
    emit(breakdown);
  }
}

class Breakdown {
  final Map<String, int> breakdown;
  Breakdown(this.breakdown);
}
