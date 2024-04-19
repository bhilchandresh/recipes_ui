import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_ui/Menu_Screen.dart';

import 'Model/ResipesAPI.dart';

class ResipesDetails extends StatefulWidget {
  Map<String, dynamic> resipeIndex;
  ResipesDetails(this.resipeIndex);

  @override
  State<ResipesDetails> createState() => _ResipesDetailsState();
}

class _ResipesDetailsState extends State<ResipesDetails> {
  @override
  ResipesAPI? resipesAPI;
  late double _rating;
  final _ratingController = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    resipesAPI = ResipesAPI.fromJson(widget.resipeIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    child: Image.network(
                      '${resipesAPI?.image}',
                      fit: BoxFit.fitHeight,
                      height: 500,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return MenuScreen();
                          },
                        ));
                      },
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 280,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return MenuScreen();
                          },
                        ));
                      },
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5),
                    child: Container(
                      height: 38,
                      width: 165,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: GFRating(
                          borderColor: Colors.yellow.shade700,
                          color: Colors.green,
                          size: 30,
                          value: resipesAPI!.rating!,
                          onChanged: (value) {
                            setState(() {
                              _rating = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 2, bottom: 6),
                        child: Text("${resipesAPI!.reviewCount}",
                            style: GoogleFonts.numans(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 17,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 6.0, right: 12, bottom: 4),
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.yellow),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("${resipesAPI!.userId}",
                                style: GoogleFonts.numans(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                  fontSize: 20,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 2),
                child: Text(
                  "${resipesAPI?.name}",
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
