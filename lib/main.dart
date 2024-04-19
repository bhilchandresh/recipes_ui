import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Menu_Screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowMaterialGrid: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 85, 15, 00),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "Assets/Images/intro_image.jpg",
                fit: BoxFit.fill,
                height: 480,
                width: double.maxFinite,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 35, 15, 00),
            child: Text(
              "Welcome to Food Bazaar",
              style: GoogleFonts.bebasNeue(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 15, 00),
            child: Text(
              "we're making your celebration as great as it\npossible. Making the best food for party ...",
              style: GoogleFonts.numans(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return MenuScreen();
                    },
                  ));
                },
                child: Container(
                  width: 310,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.pinkAccent,
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.numans(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
