import 'package:flutter/material.dart';
import 'package:game_memory_card/components/default_button.dart';
import 'package:game_memory_card/constants.dart';
import 'package:game_memory_card/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
                  SizedBox(height: getProportionateScreenHeight(24)),
                  const Text(
                    'Como jogar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  const Text(
                    "1. Escolha uma carta",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  const Text(
                    '2. Escolha outra carta',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  const Text(
                    '3. Se as cartas forem iguais, você ganha!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(24)),
                  const Text(
                    'Regras',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  const Text(
                    '1. Você escolhe uma carta',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  const Text(
                    '2. Você escolhe outra carta',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '3. Se as cartas forem iguais, você ganha!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(24)),
                  const Text(
                    'Dicas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  const Text(
                    'Decore a carta que você esta vendo.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: getProportionateScreenHeight(16)),
                  DefaultButton(
                    title: 'Começar',
                    onPressed: () {
                      Navigator.pushNamed(context, '/game');
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
