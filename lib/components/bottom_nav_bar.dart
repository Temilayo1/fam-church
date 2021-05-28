import 'package:fam_church/screens/home_page.dart';
import 'package:fam_church/screens/notes/notes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5.0,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 13),
      currentIndex: _currentIndex,
      onTap: (int index) => setState(() => _currentIndex = index),
      backgroundColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        title: '',
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.home_filled)),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_basket, color: Colors.white)),
            label: "Donations"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.book_online_sharp, color: Colors.white)),
            label: "Bible"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble, color: Colors.white)),
            label: "Connect"),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notes(),
                    ),
                  );
                },
                icon: Icon(Icons.notes, color: Colors.white)),
            label: "Notes"),

        // BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
      ],
    );
  }
}
