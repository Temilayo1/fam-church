import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                'App Update',
                style: TextStyle(
                    color: Colors.white,
                    //fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              isThreeLine: true,
              subtitle: Text(
                'Theres a recent update on our app. Please visit the app store to get updated.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  // fontWeight: FontWeight.bold),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/fc.png'),
              ),
              trailing: Text(
                '22/05/2021',
                style: TextStyle(
                    color: Colors.white,
                    //fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
