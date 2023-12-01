import 'package:flutter/material.dart';

import 'home_page.dart';
import 'my_page.dart';
import 'saved_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Medi(),
    ),
  );
}

class Medi extends StatefulWidget {
  const Medi({Key? key}) : super(key: key);

  @override
  _MediState createState() => _MediState();
}

class _MediState extends State<Medi> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          SavedPage(),
          HomePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          print("selected newIndex : $newIndex");
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ""),
        ],
      ),
    );
  }
}
