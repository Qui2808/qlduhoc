import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/model/School.dart';

class SchoolRequirement extends StatelessWidget {
  Requirement schoolRequirement;

  SchoolRequirement({required this.schoolRequirement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.05),
          child: Center(
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.width * 0.1),
                //   child: Container(
                //     child: Text(
                //       'YÊU CẦU NHẬP HỌC',
                //       style: GoogleFonts.getFont(
                //         'Montserrat',
                //         color: Theme.of(context).primaryColor,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18,
                //       ),
                //       textAlign: TextAlign.left,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.width * 0.05),
                //   child: Container(
                //     child: Text(
                //       'Tất cả sinh viên muốn đăng ký chương trình diploma '
                //       'hoặc các khóa học ngôn ngữ phải gửi bản sao của '
                //       'trang đầu hộ chiếu của mình. Yêu cầu nhập học có thể '
                //       'thay đổi cho từng loại chương trình.',
                //       style: GoogleFonts.getFont(
                //         'Montserrat',
                //         color: Theme.of(context).primaryColor,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 14,
                //       ),
                //       textAlign: TextAlign.justify,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.width * 0.1),
                //   child: Container(
                //     child: Text(
                //       'Yêu cầu nhập học cho các khóa học Tiếng Anh',
                //       style: GoogleFonts.getFont(
                //         'Montserrat',
                //         color: Theme.of(context).primaryColor,
                //         fontWeight: FontWeight.w600,
                //         fontSize: 18,
                //       ),
                //       textAlign: TextAlign.left,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.width * 0.05),
                //   child: Container(
                //     child: Text(
                //       'Tất cả sinh viên đăng ký các khóa học tiếng '
                //       'anh sẽ phải tham gia bài kiểm tra vị trí '
                //       'tiếng anh của ciccc để xác định trình độ '
                //       'tiếng anh của họ để được đặt vào lớp phù hợp.',
                //       style: GoogleFonts.getFont('Montserrat',
                //           color: Theme.of(context).primaryColor,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 14,
                //           fontStyle: FontStyle.italic),
                //       textAlign: TextAlign.justify,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.width * 0.1),
                //   child: Container(
                //     child: Text(
                //       'Yêu cầu nhập học cho chương trình Diploma',
                //       style: GoogleFonts.getFont(
                //         'Montserrat',
                //         color: Theme.of(context).primaryColor,
                //         fontWeight: FontWeight.w600,
                //         fontSize: 18,
                //       ),
                //       textAlign: TextAlign.left,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       vertical: MediaQuery.of(context).size.height * 0.03),
                //   child: Container(
                //     child: Text(
                //       'Tất cả ứng viên cho chương trình diploma '
                //       'sẽ phải tham gia bài kiểm tra vị trí '
                //       'tiếng anh của CICCC để xác định trình '
                //       'độ tiếng anh của họ để được đặt vào '
                //       'lớp phù hợp, trừ khi sinh viên có kết '
                //       'quả đạt trình độ tiếng anh khác. Sinh '
                //       'viên phải đáp ứng tất cả các yêu cầu '
                //       'để có thể bắt đầu chương trình diploma.'
                //       '\n\n'
                //       'Tốt nghiệp trung học hoặc tương đương; hoặc đủ 18 tuổi.',
                //       style: GoogleFonts.getFont(
                //         'Montserrat',
                //         color: Theme.of(context).primaryColor,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 14,
                //       ),
                //       textAlign: TextAlign.justify,
                //     ),
                //   ),
                // ),
                Html(data: '''<html>
                    <head>
                      <style>
                        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');
                        body {
                          font-family: 'Montserrat', sans-serif;
                        }
                      </style>
                    </head>
                    <body>
                      ${utf8.decode(schoolRequirement.description!.codeUnits)}
                    </body>
                  </html>''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
