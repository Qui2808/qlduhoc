import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/News.dart';

class ReadingPage extends StatefulWidget {
  News newsData;

  ReadingPage({required this.newsData});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  @override
  Widget build(BuildContext context) {
    DateTime createdAt = DateTime.parse(widget.newsData.createDate.toString());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Chi tiết tin tức',
          style: GoogleFonts.getFont(
            'Montserrat',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF7D1F1F),
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.025,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Container(
                child: Text(
                  utf8.decode(widget.newsData.titlenews.toString().codeUnits),
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              child: Image.network(
                utf8.decode(widget.newsData.imageNews.toString().codeUnits),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Container(
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
                      ${utf8.decode(widget.newsData.descriptions!.codeUnits)}
                    </body>
                  </html>
                ''',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Container(
                child: Text(
                  'Ngày đăng: ' +
                      '${createdAt.day} - ${createdAt.month} - ${createdAt.year}',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Container(
                child: Text(
                  'Theo: ' +
                      '${utf8.decode(widget.newsData.author.toString().codeUnits)}',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
