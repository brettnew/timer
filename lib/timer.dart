import 'dart:async';
import 'package:scoped_model/scoped_model.dart';

class TimerModel extends Model {
  Duration _time = Duration(minutes: 25, seconds: 0);
  double _radius = 1;

  Timer timer;
  double get radius => returnRadius(_radius);
  String get time => returnTime(_time);

  double returnRadius(double _radius) {
    return _radius;
  }

  String returnTime(Duration time) {
    return '0';
  }

  void startPomodoro() {}
  void startShort() {}
  void startLong() {}
  void startTimer(int minutes) {}

  void stopTimer() {}
  void restart() {}
}
