import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Esport extends StatelessWidget {
  const Esport({super.key});

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
          'Esport',
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
              Container(
                child: Image.asset(
                  'assets/esport/esport1.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/esport/esport2.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    top: MediaQuery.of(context).size.height * 0.02,
                    child: Center(
                      child: Text(
                        'GIỚI THIỆU NGÀNH ESPORT',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.02),
                        child: Text(
                          'Sinh viên tốt nghiệp được chuẩn bị sẵn sàng để tham gia vào ngành công nghiệp đang phát triển nhanh chóng này và có thể chọn học lên cao hơn hoặc nắm bắt nhiều cơ hội nghề nghiệp sau khi hoàn thành chương trình.',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        'assets/esport/esport3.png',
                        width: MediaQuery.of(context).size.width * 1 / 2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(38, 37, 37, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\u2022 Chuyên sâu trong học tập, nhưng linh hoạt trong lịch trình\n\n'
                          '\u2022 Định hướng kinh doanh quản lý\n\n'
                          '\u2022 Một chương trình độc đáo với việc tổ chức và quản lý dự án thi đấu thể thao điện tử ngoài đời thực\n\n'
                          '\u2022 Cơ sở đào tạo và mô phỏng hiện đại\n\n'
                          '\u2022 Các buổi thảo luận và giảng dạy theo nhóm',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          // textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/esport/esport4.png',
                          width: MediaQuery.of(context).size.width * 1 / 2,
                          height: MediaQuery.of(context).size.height * 1 / 3,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 32, 181, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.05),
                        child: Text(
                          'Tổng quan chương trình',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: Image.asset(
                              'assets/esport/esport5.png',
                              width: MediaQuery.of(context).size.width * 1 / 4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(38, 37, 37, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      top: MediaQuery.of(context).size.height * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\u2022 Chứng chỉ được cung cấp: Diploma\n\n'
                          '\u2022 Độ dài của chương trình :60-120 tuần Toàn thời gian/Bán thời gian\n\n'
                          '\u2022 Số khóa học :20\n\n'
                          '\u2022 Số tín chỉ :601010\n\n'
                          '\u2022 Tổng số giờ liên hệ :1.200\n\n'
                          '\u2022 Thời khóa biểu học kỳ\n\n'
                          '\u2022 Mùa thu (tháng 9 - tháng 12)\n\n'
                          '\u2022 Mùa đông (tháng 1 - tháng 4)\n\n'
                          '\u2022 Mùa hè (tháng 5 - tháng 8)',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          // textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/esport/esport6.png',
                          width: MediaQuery.of(context).size.width * 1 / 2,
                          height: MediaQuery.of(context).size.height * 0.39,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 32, 181, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1 / 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.05),
                          child: Expanded(
                            child: Text(
                              'Cơ hội nghề nghiệp của ngành Esport',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: Image.asset(
                              'assets/esport/esport5.png',
                              width: MediaQuery.of(context).size.width * 1 / 4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/esport/esport7.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\u2022 Chơi game chuyên nghiệp: ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Trở thành một vận động viên chuyên nghiệp,'
                                ' thi đấu trong các giải đấu và giành chiến thắng.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\u2022 Quản lý đội tuyển Esports: ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Điều hành và huấn luyện đội tuyển Esports, '
                                'quản lý các hoạt động của đội và đảm bảo sự '
                                'phát triển và thành công của các thành viên.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '\u2022 Truyền thông và sản xuất truyền hình: ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Bao gồm việc sản xuất và '
                                'phát sóng trực tiếp các trận '
                                'đấu và sự kiện Esports, quay phim, '
                                'chỉnh sửa video và quảng cáo.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\u2022 Quản lý sự kiện Esports: ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Tổ chức, quản lý và điều phối các '
                                'sự kiện Esports như giải đấu, hội '
                                'thảo, triển lãm và buổi gặp gỡ cộng đồng.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\u2022 Tiếp thị và quảng cáo Esports: ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Xây dựng chiến lược tiếp thị và quảng cáo,'
                                ' quản lý thương hiệu và tạo dựng mối quan hệ'
                                ' với khách hàng trong ngành Esports.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\u2022 Phân tích và số liệu Esports: ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Phân tích dữ liệu và số liệu thống kê '
                                'trong các trận đấu Esports, đánh giá hiệu '
                                'suất và phân tích chiến thuật.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Theme.of(context).primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                child: Image.asset(
                  'assets/esport/esport8.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   decoration: BoxDecoration(
              //     color: Color.fromRGBO(209, 32, 181, 1),
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.5,
              //   decoration: BoxDecoration(
              //     color: Colors.black,
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Container(
              //             child: Image.asset(
              //               'assets/esport/esport9.png',
              //               width: MediaQuery.of(context).size.width * 1 /2,
              //               fit: BoxFit.fill,
              //             ),
              //           ),
              //           Text(
              //             'BLOGS',
              //             style: GoogleFonts.getFont(
              //               'Montserrat',
              //               color: Colors.white,
              //               fontWeight: FontWeight.w600,
              //               fontSize: 22,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
