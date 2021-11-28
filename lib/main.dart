import 'package:flutter/material.dart';
import 'package:game_memory_card/pages/game_page.dart';
import 'package:game_memory_card/pages/home_page.dart';
import 'package:game_memory_card/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Memoria',
      theme: theme(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/game': (context) => GamePage(),
      },
    );
  }
}
