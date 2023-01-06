import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool inRunning = false;
  late Timer timer; // 당장 초기화 하지 않는 변수

  void onTick(Timer timer) {
    // 매 1초마다 HomeScreenWidget의 setState를 실행
    setState(() {
      //그때마다 남은 시간(totalSeconds)에서 1초씩 뺄거다
      totalSeconds = totalSeconds - 1;
    });
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
                "$totalSeconds",
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
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: inRunning ? onPasuePressed : onStartPressed,
                icon: inRunning
                    ? const Icon(Icons.pause_presentation_outlined)
                    : const Icon(Icons.play_circle_fill_outlined),
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
                          "0",
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
