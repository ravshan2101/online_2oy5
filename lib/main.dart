import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Cars',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _singleTab(true, 'All'),
                    _singleTab(false, 'Red'),
                    _singleTab(false, 'Blue'),
                    _singleTab(false, 'Green'),
                    _singleTab(false, 'Yellow')
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              makeItem(image: 'assets/images/1.jpeg'),
              makeItem(image: 'assets/images/2.jpeg'),
              makeItem(image: 'assets/images/3.jpeg'),
              makeItem(image: 'assets/images/4.jpeg')
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeItem({String? image}) {
  return Container(
    height: 250,
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey.shade400,
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image!), fit: BoxFit.cover)),
    child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.2),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PDP Car',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Electric',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
            const Text(
              "100\$",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        )),
  );
}

Widget _singleTab(bool type, String text) {
  return AspectRatio(
    aspectRatio: 2.2 / 1,
    child: Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: type ? Colors.grey.shade200 : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: type ? 19 : 16),
        ),
      ),
    ),
  );
}
