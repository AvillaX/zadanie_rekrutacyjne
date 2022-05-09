import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zadanie_rekrutacyjne/pages/loty.dart';
import 'package:zadanie_rekrutacyjne/pages/ulubione.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  String title = 'Loty w kosmos';

  void onBartap(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    if (selectedIndex == 0) {
      title = 'Loty w kosmos';
    } else {
      title = 'Ulubione';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: NavBar(
        index: selectedIndex,
        onTap: onBartap,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                Loty(),
                Ulubione(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final int index;
  final void Function(int)? onTap;

  const NavBar({Key? key, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      backgroundColor: Colors.black.withOpacity(0),
      color: Colors.black.withOpacity(0.7),
      height: 60,
      items: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.trending_up,
            color: Colors.white,
            size: 50,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.favorite_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
      onTap: onTap,
      buttonBackgroundColor: Colors.black,
    );
  }
}
