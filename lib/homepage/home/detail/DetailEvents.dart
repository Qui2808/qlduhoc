import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/News.dart';
import '../MainListVertical.dart';

class DetailEvents extends StatelessWidget {
  List<News> newsData;
  DetailEvents({required this.newsData});

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
          'Sự kiện mới nhất',
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
