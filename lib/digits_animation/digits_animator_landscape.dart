import 'package:flutter/material.dart';
import 'digits_painter_landscape.dart';

class DigitsAnimatorLandscape extends StatefulWidget {
  final String _digit;
  DigitsAnimatorLandscape(this._digit, {Key key}) : super(key: key);

  _DigitsAnimatorLandscapeState createState() =>
      _DigitsAnimatorLandscapeState();
}

class _DigitsAnimatorLandscapeState extends State<DigitsAnimatorLandscape>
    with SingleTickerProviderStateMixin {
  double _pulse = 0.0;
  Animation<double> pulse;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    pulse = CurveTween(curve: Curves.decelerate).animate(controller)
      ..addListener(() {
        setState(() {
          _pulse = pulse.value;
        });
      });

    controller.forward();
  }

  @override
  void didUpdateWidget(DigitsAnimatorLandscape oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._digit != widget._digit) {
      controller.reset();
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.black,
        child: CustomPaint(
      painter: DigitsPainterLandscape(widget._digit, _pulse,
          Theme.of(context).brightness == Brightness.light),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
