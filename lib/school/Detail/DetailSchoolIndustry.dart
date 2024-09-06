import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/model/School.dart';

class DetailSchoolIndustry extends StatelessWidget {
  final Program program;

  DetailSchoolIndustry({required this.program});

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
          'Chi tiết ngành học',
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
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                // child: Image.asset(
                //   'assets/industry/DetailIndustry.png',
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.2,
                //   fit: BoxFit.cover,
                // ),
                child: Image.network(program.img1.toString()),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Color(0xFFA41034),
                child: Center(
                  child: Text(
                    program.name.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.05,
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
                      ${utf8.decode(program.description1!.codeUnits)}
                    </body>
                  </html>
                  ''',
                ),
                //   child: Text(
                //     'Thông tin khóa học''\n'
                //     ' \u2022  Ngày khai giảng: 10/10/2023''\n'
                //     ' \u2022  Học phí: 6,7574 CAD''\n'
                //     ' \u2022  Liên hệ: Vui lòng liên hệ số: (08) 2225 0730 để được tư vấn''\n'
                //     ' \u2022  Văn bằng/ Chứng chỉ: Kết thúc khóa học, học viên tham gia thi trực tuyến. '
                //         'Nếu đạt yêu cầu, học viên sẽ nhận được chứng chỉ Tiếng Anh do tổ chức '
                //         'IBTA-Hoa Kỳ cấp, có giá trị trên toàn cầu''\n'
                //     ' \u2022  Tần suất khai giảng: Thường xuyên',
                //     textAlign: TextAlign.justify,
                //     style: GoogleFonts.getFont(
                //       'Montserrat',
                //       color: Theme.of(context).primaryColor,
                //       fontWeight: FontWeight.w500,
                //       fontSize: 14,
                //       height: 1.5,
                //     ),
                //   ),
              ),
              // Container(
              //   child: Image.asset(
              //     'assets/industry/industry_2.png',
              //     width: MediaQuery.of(context).size.width,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Container(
                child: Image.network(program.img2.toString()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.05,
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
                      ${utf8.decode(program.description2!.codeUnits)}
                    </body>
                  </html>
                ''',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
