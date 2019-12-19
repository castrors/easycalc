import 'package:easycalc/constants.dart';
import 'package:flutter/material.dart';

class SimulationRow extends StatelessWidget {
  final String title;
  final String value;
  const SimulationRow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: rowKeyStyle),
        Text(value, style: rowValueStyle),
      ],
    );
  }
}
