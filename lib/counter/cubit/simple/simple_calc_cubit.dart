import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'simple_calc_state.dart';

class SimpleCalcCubit extends Cubit<SimpleCalcState> {
  SimpleCalcCubit() : super(SimpleCalcCalculated(null));

  List<num> validDenominations = [200, 50, 20, 10, 5, 2, 1, 0.5, 0.2];

  void calculateWithMod(double cost, double tender) {

    var change = tender - cost;
    var breakdown = SimpleCalcCalculated({'Total change': change});

    for (var denomination in validDenominations) {
      var result = change / denomination;
      if (result >= 1) {
        breakdown.values['R$denomination'] = result.toInt();
        change = change - (denomination * result.toInt());
      }
    }

    emit(breakdown);
  }
}
