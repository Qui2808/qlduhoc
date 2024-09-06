import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/school/List/ListSchoolIndustry.dart';

import '../model/School.dart';
import 'Detail/DetailSchoolIndustry.dart';

class SchoolIndustry extends StatelessWidget {
  final List<Program> program;

  SchoolIndustry({required this.program});

  final List _schoolsIndustry = [
    'Quản lý khách sạn',
    'Quản lý kinh doanh khách sạn',
    'Chuyên gia Marketing kỹ thuật số',
    'Chuyên gia Quan hệ khách hàng',
    'Giao diện người dùng UI/UX',
    'Phát triển ứng dụng',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start, //Thêm dòng này
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  'CÁC NGÀNH HỌC TẠI CORNERSTONE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height:
                  MediaQuery.of(context).size.height * program.length * 0.11,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  itemCount: program.length,
                  itemBuilder: (context, index) {
                    return ListSchoolIndustry(
                      schoolIndustryChild: program[index].name.toString(),
                      onTap: () {
                        // Điều hướng sang màn hình chi tiết và vẫn giữ tab bar
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailSchoolIndustry(
                                    program: program[index])));
                      },
                    );
                  }),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  'THEO DÕI QUÁ TRÌNH HỌC Ở CANADA',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1 * (3 / 4),
                  right: MediaQuery.of(context).size.width * 0.1 * (3 / 4),
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cập nhật thông tin cho phụ huynh trong quá trình học ở Canada',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Hỗ trợ du học sinh trong quá trình học ở Canada ( nơi ở , sinh hoạt, đi lại ..)',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Chia sẻ thông tin về cơ hội việc làm cho du học sinh',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Chia sẻ thông tin lưu trú tại Canada',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
