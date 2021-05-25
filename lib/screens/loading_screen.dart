import 'package:fam_church/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          // color: Colors.grey,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fcloading.png'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          title: '',
                        ),
                      ),
                    );
                  },
                  child: SpinKitWave(
                    size: 50,
                    itemBuilder: (_, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: index.isEven
                                ? Colors.white
                                : Colors.blue.withOpacity(0.5)),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 80),
            ],
          )),
    );
  }
}
