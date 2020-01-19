import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'digits_animation/digits_animator_landscape.dart';
import 'streams/timer_streams.dart';

enum _Element {
  background,
  text,
  shadow,
}

final _lightTheme = {
  _Element.background: Color(0xffd3e7ee),
  _Element.text: Color(0xfff0f0f0),
  _Element.shadow: Color(0xff363636),
};

final _darkTheme = {
  _Element.background: Color(0xff121212),
  _Element.text: Color(0xff363636),
  _Element.text: Color(0xff666666),
};

class DigitalClockAnimated extends StatefulWidget {
  DigitalClockAnimated(this.model)
      : _timerBloc = TimerBloc(model.is24HourFormat);

  final ClockModel model;
  final TimerBloc _timerBloc;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClockAnimated> {
  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClockAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    widget._timerBloc.closeStream();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final baseWidth = screenWidth / 7;
    final baseHeight = baseWidth * 1.5;
    final fontSize = screenWidth / 3.5;
    final offset = -fontSize / 7;
    final double top = 300;

    return Container(
      color: colors[_Element.background],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: <Widget>[
                  Text(
                    widget.model.temperatureString,
                    style: TextStyle(color: colors[_Element.text]),
                  ),
                  SizedBox(height: 10,width:10),
                  Text(
                    widget.model.location,
                    style: TextStyle(color: colors[_Element.text]),
                  
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                      width: baseWidth,
                      height: baseHeight,
                      child: StreamBuilder<String>(
                          stream: widget._timerBloc.deciHourssStream,
                          builder: (context, snapshot) {
                            return DigitsAnimatorLandscape(snapshot.data);
                          })),
                  SizedBox(
                      width: baseWidth,
                      height: baseHeight,
                      child: StreamBuilder<String>(
                          stream: widget._timerBloc.hoursStream,
                          builder: (context, snapshot) {
                            return DigitsAnimatorLandscape(snapshot.data);
                          })),
                  SizedBox(
                      width: baseWidth,
                      height: baseHeight,
                      child: StreamBuilder<String>(
                          stream: widget._timerBloc.deciMinutesStream,
                          builder: (context, snapshot) {
                            return DigitsAnimatorLandscape(snapshot.data);
                          })),
                  SizedBox(
                      width: baseWidth,
                      height: baseHeight,
                      child: StreamBuilder<String>(
                          stream: widget._timerBloc.minutesStream,
                          builder: (context, snapshot) {
                            return DigitsAnimatorLandscape(snapshot.data);
                          })),
                  SizedBox(
                      width: baseWidth * 0.6,
                      height: baseHeight * 0.6,
                      child: StreamBuilder<String>(
                          stream: widget._timerBloc.deciSecondsStream,
                          builder: (context, snapshot) {
                            return DigitsAnimatorLandscape(snapshot.data);
                          })),
                  SizedBox(
                      width: baseWidth * 0.6,
                      height: baseHeight * 0.6,
                      child: StreamBuilder<String>(
                          stream: widget._timerBloc.secondsStream,
                          builder: (context, snapshot) {
                            return DigitsAnimatorLandscape(snapshot.data);
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
