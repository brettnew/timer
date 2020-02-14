import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'widgets.dart';
import 'timer.dart';
import 'package:scoped_model/scoped_model.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: TimerModel(),
      child: MaterialApp(
          title: 'Productivity Timer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red),
          home: MyHomePage(title: 'Productivity Timer')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final double smallButtonSize = size / 3.2;
    final double largeButtonSize = size / 2.1;
    return ScopedModel(
      model: TimerModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(Colors.red,
                        'Pomodoro', model.startPomodoro, smallButtonSize),
                  ),
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                        Color(0xff8BC34A),
                        'Short Break',
                        model.startShort,
                        smallButtonSize),
                  ),
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                        Color(0xff689F38),
                        'Long Break',
                        model.startLong,
                        smallButtonSize),
                  )
                ],
              ),
              Expanded(
                child: ScopedModelDescendant<TimerModel>(
                  builder: (context, _, model) => CircularPercentIndicator(
                    radius: 180.0,
                    lineWidth: 10.0,
                    percent: model.radius,
                    center: Text(model.time,
                        style: Theme.of(context).textTheme.display1),
                    progressColor: Colors.green,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                        Colors.red, 'Stop', model.stopTimer, largeButtonSize),
                  ),
                  ScopedModelDescendant<TimerModel>(
                    builder: (context, _, model) => TomatoButton(
                        Color(0xff689F38),
                        'Restart',
                        model.restart,
                        largeButtonSize),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
