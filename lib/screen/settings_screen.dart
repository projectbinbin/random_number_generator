import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    required this.maxNumber,
    Key? key,
  }) : super(key: key);

  final int maxNumber;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                _Body(maxNumber: maxNumber),
                _Footer(
                  maxNumber: maxNumber,
                  onChanged: onSliderChanged,
                  onButtonPressed: onSaveButtonPressed,
                ),
              ],
            ),
          ),
        ));
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  void onSaveButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onChanged;
  final VoidCallback onButtonPressed;

  const _Footer({
    required this.maxNumber,
    required this.onChanged,
    required this.onButtonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 10000,
          onChanged: onChanged,
        ),
        ElevatedButton(
          child: Text('저장!'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: onButtonPressed,
        ),
      ],
    );
  }
}
