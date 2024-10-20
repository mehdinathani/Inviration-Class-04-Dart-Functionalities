import 'dart:developer';

import 'package:flutter/material.dart';

class FutureDemo extends StatefulWidget {
  const FutureDemo({super.key});

  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  int counter1 = 0;
  int counter2 = 0;
  int updateCounter() {
    counter1 = counter1++;
    return counter1++;
  }

  Future<int> getFutureData() async {
    await Future.delayed(Duration(seconds: 3));
    counter1 = counter1++;
    return counter1;
  }

  Stream<int> getLiveStreaming() async* {
    int value = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      value = value + 1;
      log(value.toString());
      yield value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: getLiveStreaming(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            FutureBuilder(
                future: getFutureData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
            Text(
              counter1.toString(),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  updateCounter();
                  setState(() {});
                },
                child: Text("Counter"))
          ],
        ),
      ),
    );
  }
}
