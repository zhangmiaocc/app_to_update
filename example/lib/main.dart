import 'package:flutter/material.dart';
import 'package:app_to_update/app_to_update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    AppToUpdate.updateApp(AppleId: "1423558902");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: GestureDetector(
            child: Text('跳转到AppStore'),
            onTap: (){
              AppToUpdate.updateApp(AppleId: "1423558902");
            },
          ),
        ),
      ),
    );
  }
}
