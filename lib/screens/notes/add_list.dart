import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  @override
  Widget build(BuildContext context) {
    String title;
    String dateTime;
    String desc;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        height: size.height / 1.19,
        child: Column(
          children: [
            Text(
              "Add a Note",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30),
            Text(
              'Note Title',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                maxLines: 1,
                maxLength: 25,
                style: TextStyle(fontSize: 18),
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white),
                // autofocus: true,
                textAlign: TextAlign.center,
              ),
            ),
            //  SizedBox(height: 5),
            Text(
              'Note Description',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                height: size.height / 2.3,
                child: TextField(
                  maxLines: 250,

                  //// maxLength: 30,
                  style: TextStyle(fontSize: 18),
                  onChanged: (value) {
                    title = value;
                  },
                  decoration: InputDecoration(
                      focusColor: Colors.white,
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      filled: true,
                      fillColor: Colors.white),
                  // autofocus: true,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                height: 65,
                width: size.width / 1,
                color: Colors.grey.withOpacity(0.2),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'SAVE NOTE',
                      style: TextStyle(
                        letterSpacing: 7,
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
