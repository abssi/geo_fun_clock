import 'dart:async';
import 'ticker.dart';
import 'package:intl/intl.dart';


class TimerBloc{
  
  final Ticker _ticker = Ticker();
  final StreamController <String> _timeStreamController = StreamController.broadcast();

  bool _is24HourFormat = false;

  TimerBloc(this._is24HourFormat){
    _ticker.tick().listen((time) => _timeStreamController.add(_getTime(time)));
  }
  Stream <String> get secondsStream => _timeStreamController.stream.map(
      (time) => time[5]
  );
  Stream <String> get deciSecondsStream => _timeStreamController.stream.map(
      (time) => time[4]
  );
  Stream <String> get minutesStream => _timeStreamController.stream.map(
      (time) => time[3]
  );
  Stream <String> get deciMinutesStream => _timeStreamController.stream.map(
      (time) => time[2]
  );
  Stream <String> get hoursStream => _timeStreamController.stream.map(
      (time) => time[1]
  );
  Stream <String> get deciHourssStream => _timeStreamController.stream.map(
      (time) => time[0]
  );
  
  String  _getTime(DateTime time){
     final String hourFormat = _is24HourFormat ? 'HH' : 'hh';
     final String dateFormat = hourFormat+'mm'+'ss';
     final date =
        DateFormat(dateFormat).format(time);
    return date;
  }

  closeStream() {
    _timeStreamController.close();
 }

}