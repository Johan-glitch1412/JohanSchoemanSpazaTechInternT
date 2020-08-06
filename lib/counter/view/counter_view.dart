import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';
import '../counter.dart';
import '../counter.dart';

class CounterView extends StatelessWidget {
  final txtTender = TextEditingController();
  final txtCost = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, Breakdown>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.00),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('Product Cost:'),
                          flex: 1,
                        ),
                        Expanded(
                          child: TextField(controller: txtCost),
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.00),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('Tender Amount:'),
                          flex: 1,
                        ),
                        Expanded(
                          child: TextField(controller: txtTender),
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      '${context.bloc<CounterCubit>().state.breakdown}',
                      style: TextStyle(fontSize: 20.00),
                    ),
                  ),
                ],
              ),
            );

            Text('$state', style: textTheme.headline2);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: FlatButton(
              key: const Key('counterView_increment_floatingActionButton'),
              onPressed: () {
                if (double.tryParse(txtCost.text) == null ||
                    double.tryParse(txtTender.text) == null) {
                  context.bloc<CounterCubit>().invalidType(
                      'Invalid entry in Product Cost or Tender Amount fields. Please Enter amount in format 00.00');
                }
                context.bloc<CounterCubit>().calculate(
                      double.tryParse(txtCost.text),
                      double.parse(txtTender.text),
                    );
              },
              child: Text('Calculate change'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
