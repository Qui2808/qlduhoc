import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/homepage/home/ReadingPage.dart';
import 'package:qlduhoc/school/SchoolMain.dart';

import '../../model/News.dart';
import '../mainpage.dart';

class MainListHorizontal extends StatelessWidget {
  News newsData;

  MainListHorizontal({required this.newsData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ReadingPage(newsData: newsData)));},
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * (3 / 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFF909090),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01,
                  vertical: MediaQuery.of(context).size.height * 0.005,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    newsData.imageNews.toString(),
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.005,
                ),
                child: Text(
                  utf8.decode(newsData.titlenews.toString().codeUnits),
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
