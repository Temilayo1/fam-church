import 'package:fam_church/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class NaviationDrawer extends StatelessWidget {
  const NaviationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/fc.png'),
                  // child: Text("LA"),
                ),
                accountName: Text(
                  'Layon',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('1313@gmail.com'),
              ),
            ),
            // Divider(height: 10, color: Colors.white),
            Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {},
                trailing: Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  'Donations',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(height: 1, color: Colors.white),
            Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {},
                trailing: Icon(Icons.chat_bubble_outline_outlined,
                    color: Colors.white),
                title: Text(
                  'Lets Connect',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(height: 1, color: Colors.white),
            Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {},
                trailing: Icon(Icons.notes_outlined, color: Colors.white),
                title: Text(
                  'Sermon Notes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(height: 1, color: Colors.white),
            Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {},
                trailing: Icon(Icons.link, color: Colors.white),
                title: Text(
                  'Websites',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(height: 1, color: Colors.white),
            Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {},
                trailing: Icon(Icons.check_box_outlined, color: Colors.white),
                title: Text(
                  'Check-in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(height: 1, color: Colors.white),
            Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
                trailing:
                    Icon(Icons.notifications_outlined, color: Colors.white),
                title: Text(
                  'Notifications',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
