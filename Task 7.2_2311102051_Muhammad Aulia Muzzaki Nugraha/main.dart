import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout part 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo Layout part 1'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                          color: Color(0xFF7367F0),
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.25,
                        ),
                      ),
                      Text(
                        "2311102051 - M. Aulia Muzzaki Nugraha",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4B4B4B),
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                  ),
                ],
              ),
            ),

            // CARD NILAI TOEFL
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4839EB), Color(0xFF7367F0)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Status tes TOEFL Anda:',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'LULUS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // SCORE SECTION
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Listening\n80',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Structure\n80',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Reading\n90',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // FOOTER TITLE
            Container(
              child: const Text(
                'Riwayat Tes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}