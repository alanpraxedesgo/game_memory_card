import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Memoria'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 24),
                  const Text(
                    'Como jogar',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "1. Escolha uma carta",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '2. Escolha outra carta',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '3. Se as cartas forem iguais, você ganha!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Regras',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '1. Você escolhe uma carta',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '2. Você escolhe outra carta',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '3. Se as cartas forem iguais, você ganha!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Dicas',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Decore a carta que você esta vendo.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/game');
                    },
                    child: const Text(
                      'Jogar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
