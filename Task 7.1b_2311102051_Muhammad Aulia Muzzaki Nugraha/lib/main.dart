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
      title: 'Tugas Array 2D dan FPB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Tugas Array 2D dan FPB'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            getOutput(),
            style: const TextStyle(
              fontSize: 20,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

String getOutput() {
  List<List<int>> data = [];

  // Baris 1: 4 bilangan kelipatan 6 mulai dari 6
  List<int> baris1 = [];
  for (int i = 0; i < 4; i++) {
    baris1.add(6 * (i + 1));
  }

  // Baris 2: 5 bilangan ganjil mulai dari 3
  List<int> baris2 = [];
  int ganjil = 3;
  for (int i = 0; i < 5; i++) {
    baris2.add(ganjil);
    ganjil += 2;
  }

  // Baris 3: 6 bilangan pangkat tiga mulai dari 4
  List<int> baris3 = [];
  for (int i = 4; i < 10; i++) {
    baris3.add(i * i * i);
  }

  // Baris 4: 7 bilangan beda 7 mulai dari 3
  List<int> baris4 = [];
  int angka = 3;
  for (int i = 0; i < 7; i++) {
    baris4.add(angka);
    angka += 7;
  }

  data.add(baris1);
  data.add(baris2);
  data.add(baris3);
  data.add(baris4);

  String hasil = "Isi List:\n";
  for (var row in data) {
    hasil += "${row.join(" ")}\n";
  }

  int a = 12;
  int b = 8;

  hasil += "\nBilangan 1: $a\n";
  hasil += "Bilangan 2: $b\n";
  hasil += "FPB $a dan $b = ${fpb(a, b)}";

  return hasil;
}

int fpb(int a, int b) {
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }
  return a;
}