import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({super.key, required this.maxNumber});

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
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(
                maxNumber: maxNumber,
              ),
              _Footer(
                maxNumber: maxNumber,
                onSlideChanged: onSlideChanged,
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSlideChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final maxNumber;
  const _Body({super.key, this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: maxNumber
            .toInt()
            .toString()
            .split('')
            .map((x) => Image.asset(
                  'asset/img/$x.png',
                  width: 50.0,
                  height: 70.0,
                ))
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSlideChanged;
  final VoidCallback onPressed;
  const _Footer(
      {super.key,
      this.onSlideChanged,
      required this.onPressed,
      required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 10000,
          onChanged: onSlideChanged,
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR,
          ),
          child: Text('SAVE!'),
        )
      ],
    );
  }
}
