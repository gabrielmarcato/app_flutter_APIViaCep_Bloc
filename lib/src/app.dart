import 'package:flutter/material.dart';
import 'ui/view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API VIACEP'),
        ),
        body: ViewViaCep(),
      ),
    );
  }
}
