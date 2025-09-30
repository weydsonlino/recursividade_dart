import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const CronometroApp());
}

class CronometroApp extends StatelessWidget {
  const CronometroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CronometroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CronometroPage extends StatefulWidget {
  const CronometroPage({super.key});

  @override
  State<CronometroPage> createState() => CronometroPageState();
}

class CronometroPageState extends State<CronometroPage> {
  int segundos = 0;
  bool rodando = false;

  void iniciarCronometro() {
    if (rodando) return;
    rodando = true;
    tick(segundos);
  }

  void tick(int segundos) {
    if (!rodando) return;

    setState(() {
      this.segundos = segundos;
    });

    if (segundos > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (rodando) {
          tick(segundos + 1);
        }
      });
    } else {
      tick(1);
    }
  }

  void _pararCronometro() {
    setState(() {
      rodando = false;
    });
  }

  void _resetarCronometro() {
    setState(() {
      rodando = false;
      segundos = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$segundos s',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: iniciarCronometro,
                  child: const Text("Iniciar"),
                ),
                ElevatedButton(
                  onPressed: _pararCronometro,
                  child: const Text("Parar"),
                ),
                ElevatedButton(
                  onPressed: _resetarCronometro,
                  child: const Text("Resetar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
