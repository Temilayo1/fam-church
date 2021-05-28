import 'package:fam_church/components/bottom_nav_bar.dart';
import 'package:fam_church/components/navigation_drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: NaviationDrawer(),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: (AssetImage(
                            'assets/1.jpeg',
                          )),
                          fit: BoxFit.fill,
                        ),
                      ),
                      // color: Colors.grey,
                      height: size.height / 4,
                      // height: 60,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Websites',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                height: size.height / 2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/2.jpeg'),
                                  ),
                                  // color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/2.jpeg'),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // child: Text(
                                //   'Websites',
                                //   style: TextStyle(fontSize: 20, color: Colors.red),
                                // ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/1.jpeg'),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // child: Text(
                                //   'Websites',
                                //   style: TextStyle(fontSize: 20, color: Colors.red),
                                // ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/2.jpeg'),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // child: Text(
                                //   'Websites',
                                //   style: TextStyle(fontSize: 20, color: Colors.red),
                                // ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/1.jpeg'),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // child: Text(
                                //   'Websites',
                                //   style: TextStyle(fontSize: 20, color: Colors.red),
                                // ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height / 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/1.jpeg'),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Websites',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
