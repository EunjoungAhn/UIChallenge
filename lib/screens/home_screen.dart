import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFIveMinutes = 1500;
  int totalSeconds = twentyFIveMinutes;
  bool inRunning = false;
  int totalPomodoros = 0;
  late Timer timer; // 당장 초기화 하지 않는 변수

  void onTick(Timer timer) {
    // 0초에 시간 초기화
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        inRunning = false;
        totalSeconds = twentyFIveMinutes;
      });
      timer.cancel();
    } else {
      // 매 1초마다 HomeScreenWidget의 setState를 실행
      setState(() {
        //그때마다 남은 시간(totalSeconds)에서 1초씩 뺄거다
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1), // 매 1초 하다 여기있는 함수가 실행
      onTick,
    );
    setState(() {
      inRunning = true;
    });
  }

  void onPasuePressed() {
    timer.cancel();
    setState(() {
      inRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  void reSetTimer() {
    setState(() {
      timer.cancel();
      totalSeconds = twentyFIveMinutes;
      inRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          // Flexible UI를 비율에 기반해서 더 유연하게 만들 수 있다.
          // 하나의 박스가 얼마나 공간을 차지할 지 비율을 정할 수 있다.
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: inRunning ? onPasuePressed : onStartPressed,
                    icon: inRunning
                        ? const Icon(Icons.pause_presentation_outlined)
                        : const Icon(Icons.play_circle_fill_outlined),
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Theme.of(context).cardColor,
                    onPressed: reSetTimer,
                    icon: const Icon(Icons.replay),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
