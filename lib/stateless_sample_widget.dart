import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widget_sample/rabbit.dart';

class StatelessSampleWidget extends StatelessWidget {
  //가려진 박스: 외부에는 노출 안됨
  String title;
  Rabbit rabbit;
  StatelessSampleWidget({this.title, this.rabbit}) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      int index = timer.tick % 4;
      switch (index) {
        case 0:
          rabbit.updateState(RabbitState.SLEEP);
          break;
        case 1:
          rabbit.updateState(RabbitState.WALK);
          break;
        case 2:
          rabbit.updateState(RabbitState.RUN);
          break;
        case 3:
          rabbit.updateState(RabbitState.EAT);
          break;
      }
      print(rabbit.state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        child: Center(
          child: Text(
            rabbit.state.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
