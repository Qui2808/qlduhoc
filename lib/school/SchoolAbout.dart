
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/School.dart';

class SchoolAbout extends StatelessWidget {
  History historySchool;

  SchoolAbout({required this.historySchool});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  historySchool.img.toString(),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Html(
                data: '''
                    <html>
                      <head>
                        <style>
                          @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
                          body {
                            font-family: 'Montserrat', sans-serif;
                          }
                        </style>
                      </head>
                      <body>
                        ${utf8.decode(historySchool.description1!.codeUnits)}
                      </body>
                    </html>
                  ''',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Html(
                data: '''
                    <html>
                      <head>
                        <style>
                          @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
                          body {
                            font-family: 'Montserrat', sans-serif;
                          }
                        </style>
                      </head>
                      <body>
                        ${utf8.decode(historySchool.description2!.codeUnits)}
                      </body>
                    </html>
                  ''',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,)
          ],
        ),
      ),
    );
  }
}
