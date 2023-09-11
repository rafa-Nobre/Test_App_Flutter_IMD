import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurante'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 100,
              child: const Column(
                children: <Widget>[Text('Olá, seja bem vindo!')],
              ),
            ),
          ),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado, não pode entrar.";
        _pessoa = 20;
      } else if (_pessoa < 20 && _pessoa >= 0) {
        _mensagem = "Pode entrar!";
      } else {
        _pessoa = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "lib/assets/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoa",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            ), //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: const Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: const Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
            ) //text
          ], //widget
        ) //Column
      ],
    );
  }
}
