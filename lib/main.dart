import 'package:flutter/material.dart';
import 'package:jogo_memoria/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Memória",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
