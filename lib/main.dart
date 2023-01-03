import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text("Welcome back",
                        style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 120,),
              Text(
                "Total Balance", 
                style:  TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 22,
                  ),
              ),
              SizedBox(height: 10,),
              Text(
                "\$5 194 482", 
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w600
                  ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Text("Transfer", style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}
