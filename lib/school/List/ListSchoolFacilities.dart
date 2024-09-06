import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/school/Detail/DetailSchoolFacilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../homepage/mainpage.dart';

class ListSchoolFacilities extends StatefulWidget {
  final String schoolFacilitiesNameChild;
  final String schoolFacilitiesDescriptionChild;
  final String schoolFacilitiesImageChild;

  ListSchoolFacilities(
      {required this.schoolFacilitiesNameChild,
      required this.schoolFacilitiesDescriptionChild,
      required this.schoolFacilitiesImageChild});

  @override
  State<ListSchoolFacilities> createState() => _ListSchoolFacilitiesState(
      schoolFacilitiesNameChild: schoolFacilitiesNameChild,
      schoolFacilitiesDescriptionChild: schoolFacilitiesDescriptionChild,
      schoolFacilitiesImageChild: schoolFacilitiesImageChild);
}

class _ListSchoolFacilitiesState extends State<ListSchoolFacilities> {
  final String schoolFacilitiesNameChild;
  final String schoolFacilitiesDescriptionChild;
  final String schoolFacilitiesImageChild;

  _ListSchoolFacilitiesState(
      {required this.schoolFacilitiesNameChild,
      required this.schoolFacilitiesDescriptionChild,
      required this.schoolFacilitiesImageChild});

  late SharedPreferences themeMode;

  bool _thememode = false;

  String description = "";

  @override
  void initState() {
    super.initState();
    initial();
    description = utf8.decode(schoolFacilitiesDescriptionChild.codeUnits);
    print(description);
  }

  void initial() async {
    themeMode = await SharedPreferences.getInstance();
    setState(() {
      _thememode = themeMode.getBool('theme') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.015),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: _thememode ? Color(0xFF5e5e5e) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _thememode ? Color(0xFF5e5e5e) : Color(0xFF909090),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    // child: Image.asset(
                    //   schoolFacilitiesImageChild,
                    //   width: 150,
                    //   height: 120,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Image.network(
                      schoolFacilitiesImageChild,
                      width: 150,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: 180,
                height: 150,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                        child: Text(
                          schoolFacilitiesNameChild,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                        child: Html(
                          data: '''
          <html>
            <head>
              <style>
                @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
                body {
                  font-family: 'Montserrat', sans-serif;
                  overflow: hidden; /* Prevent overflow */
                display: -webkit-box;
                -webkit-line-clamp: 3; /* Limit number of lines */
                -webkit-box-orient: vertical;
                }
              </style>
            </head>
            <body>
              ${description}
            </body>
          </html>
        ''',
                          // textStyle: GoogleFonts.getFont(
                          //   'Montserrat',
                          //   fontSize: 10,
                          //   fontWeight: FontWeight.w500,
                          // ),
                          //textAlign: TextAlign.start,
                          // style: GoogleFonts.getFont(
                          //   'Montserrat',
                          //   fontSize: 10,
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: AlignmentDirectional(-1.00, 0.00),
                    //   child: Padding(
                    //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    //     child: RatingBar.builder(
                    //       initialRating: 5,
                    //       minRating: 1,
                    //       direction: Axis.horizontal,
                    //       allowHalfRating: true,
                    //       itemCount: 5,
                    //       itemSize: 25,
                    //       itemBuilder: (context, _) => Icon(
                    //         Icons.star,
                    //         color: Color.fromRGBO(255, 83, 49, 1),
                    //       ),
                    //       onRatingUpdate: (rating) {
                    //         print(rating);
                    //       },
                    //       ignoreGestures: true,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
