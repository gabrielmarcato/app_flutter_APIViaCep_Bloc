import 'package:flutter/material.dart';
import 'ui/view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ViewViaCep(),
      ),
    );
  }
}
