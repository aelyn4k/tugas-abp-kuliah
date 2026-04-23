import 'package:flutter/material.dart';
import 'tutorial_11-2.dart';

class TutorialHomePage extends StatefulWidget {
  const TutorialHomePage({super.key, required this.title});

  final String title;

  @override
  State<TutorialHomePage> createState() => _TutorialHomePageState();
}

class _TutorialHomePageState extends State<TutorialHomePage> {
  int selected = 0;
  final PageController pc = PageController(initialPage: 0);

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            Center(
              child: InkWell(
                child: const Text(
                  'Go to Home page',
                  style: TextStyle(fontSize: 30),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Tutorial112Page(),
            const Center(
              child: Text(
                'Profile page',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}