import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/homepage/home/MainListVertical.dart';

import '../../../model/News.dart';

class DetailNews extends StatelessWidget {
  List<News> newsData;
  DetailNews({required this.newsData});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tin tức mới nhất',
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
      body: ListView.builder(
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            return MainListVertical(newsData: newsData[index]);
          }),
    );
  }
}
