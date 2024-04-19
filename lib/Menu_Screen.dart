import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Resipes_Details.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var url = Uri.https('dummyjson.com', 'recipes');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map m = jsonDecode(response.body);
    resipieList = m['recipes'];
    setState(() {});
  }

  List resipieList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: Colors.red,
                size: 20,
              ),
              Text(
                " Surat",
                style: GoogleFonts.numans(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              Text(
                ", INDIA",
                style: GoogleFonts.numans(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0, top: 3),
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.black,
                size: 25,
              ),
            )
          ]),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 300,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 0, right: 5, left: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1),
                      ),
                    ),
                    maxLines: 1,
                    style: GoogleFonts.numans(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 11, left: 2),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    // CupertinoIcons.arrow_3_trianglepath,
                    Icons.menu,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          //-------------------------- Searchbar and More Button ------------------
          Flexible(
              child: GridView.builder(
            itemCount: resipieList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return ResipesDetails(resipieList[index]);
                    },
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Stack(
                      children: [
                        Image.network(
                          "${resipieList[index]['image']}",
                        ),
                        Positioned(
                          top: 132,
                          child: Container(
                            color: Colors.white,
                            width: 158,
                            height: 25,
                            child: Center(
                              child: Text("${resipieList[index]['name']}",
                                  style: GoogleFonts.numans(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
