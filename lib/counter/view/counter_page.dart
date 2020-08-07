import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/cubit/simple/simple_calc_cubit.dart';
import 'package:flutter_counter/counter/view/simple_calc_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleCalcCubit(),
      child: SimpleCalcView(),
    );
  }
}
