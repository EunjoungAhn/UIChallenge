import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text("nothing"),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // 오직 단 한번만 호출된다.
  @override
  void initState() {
    // 최신 api를 업데이트 할때 등등
    super.initState();
    print("initState");
  }
  // build 빌드 메서드 보다 먼저 호출되어야 한다.

  //dispose는 위젯이 스크린에서 제거될 때 호출되는 메서드다.
  @override
  void dispose() {
    // api 업데이트나 이벤트 리스너로 부터 구독을 취소할때 등등
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        //BuildContext context는 최상의 부모의 정보까지 알 수 있다.
        //위젯 트리에서 위젯의 위치를 제공하고 이를 통해 상위 요소 데이터에 접근할 수 있다.
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
