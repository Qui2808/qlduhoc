import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/login/LoginPage.dart';
import 'package:qlduhoc/login/RegisterMain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirtPage extends StatefulWidget {
  @override
  State<FirtPage> createState() => _FirtPageState();
}

class _FirtPageState extends State<FirtPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,

            //ảnh nền

            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/logo.png'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height * 0.18, 0, 0),
              child: Text(
                'XIN CHÀO !',
                style: TextStyle(
                  color: Color.fromRGBO(125, 31, 31, 1.0),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              // Hình dưới 60% chiều dọc
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(125, 31, 31, 1.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter, // Đặt hình ảnh ở trên cùng
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  Spacer(),
                  // Tạo khoảng trống giữa hình ảnh và các nút, đẩy các nút xuống dưới cùng
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                      child: Text(
                        'ĐĂNG NHẬP',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      bottom: 70,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // Điều chỉnh độ bo góc ở đây
                            side: BorderSide(
                              color: Colors.white, // Màu của viền
                              width: 1.0, // Độ dày của viền
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        'ĐĂNG KÝ',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
