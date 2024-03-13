import 'dart:async';

import 'package:flutter/material.dart';
import 'package:front_end/main.dart';
import 'package:front_end/page_kamus.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  void dataScreen() async {
    Timer(Duration(seconds: 2), () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingPage()),
          (route) => false);
    });
  }

  @override
  void initState() {
    dataScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 193, 214),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  "images/book.jpg",
                  // width: 50,
                  // height: ,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  "Dictionary App Indonesia - Germany",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
