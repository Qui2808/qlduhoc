import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/homepage/info/AboutUs.dart';
import 'package:qlduhoc/homepage/info/Contact.dart';
import 'package:qlduhoc/homepage/info/Esport.dart';
import 'package:qlduhoc/homepage/info/ProfilePage.dart';
import 'package:qlduhoc/homepage/info/transcript/Transcript.dart';
import 'package:qlduhoc/homepage/info/transcript/customtable.dart';
import 'package:qlduhoc/homepage/mainpage.dart';
import 'package:qlduhoc/login/FirtPage.dart';
import 'package:qlduhoc/login/LoginPage.dart';
import 'package:qlduhoc/login/RegisterMain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/User.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late SharedPreferences logindata;

  String avatar = "";
  String username = "";
  String dob = "";
  String address = "";
  String phone = "";
  String gender = "";
  String email = "";

  bool login = false;

  //switch
  bool _nofication = false;

  //

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();

    login = logindata.getBool('login') ?? false;

    avatar = await logindata.getString('avatar') ?? "";
    username = await logindata.getString('username') ?? "";
    dob = await logindata.getString('dob') ?? "";
    address = await logindata.getString('address') ?? "";
    phone = await logindata.getString('phone') ?? "";
    gender = await logindata.getString('gender') ?? "";
    email = await logindata.getString('email') ?? "";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: login == true,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (1 / 16),
                  ),
                  child: InkWell(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));}, //Gắn trang info
                    child: Container(
                      width: MediaQuery.of(context).size.width * (1 / 5),
                      height: MediaQuery.of(context).size.width * (1 / 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: avatar == 'null'
                          ? Image.network(
                        "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                        fit: BoxFit.fill,
                      )
                          : Image.network(
                        avatar,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: login == true,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * (1 / 64)),
                  child: Container(
                    child: Text(
                      '${utf8.decode(username.codeUnits)}',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: login == true,
                child: Container(
                  child: Text(
                    '${utf8.decode(email.codeUnits)}',
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: login == false,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * (1 / 8),
                  )),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: MediaQuery.of(context).size.width * (1 / 32),
              //     top: MediaQuery.of(context).size.height * (1 / 32),
              //     bottom: MediaQuery.of(context).size.height * (1 / 64),
              //   ),
              //   child: Container(
              //     // width: MediaQuery.of(context).size.width,
              //     child: Align(
              //       alignment: AlignmentDirectional(-1.00, 0),
              //       child: Text(
              //         'Thông báo',
              //         style: GoogleFonts.getFont(
              //           'Montserrat',
              //           color: Theme.of(context).primaryColor,
              //           fontWeight: FontWeight.w500,
              //           fontSize: 13,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.95,
              //   // height: MediaQuery.of(context).size.height * (1/12),
              //   decoration: BoxDecoration(
              //     color: Color(0xFFD9D9D9),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: MediaQuery.of(context).size.width * 0.05,
              //             vertical: MediaQuery.of(context).size.height * 0.03),
              //         child: Align(
              //           alignment: AlignmentDirectional(-1.00, 0.00),
              //           child: Text(
              //             'Bật thông báo',
              //             style: GoogleFonts.getFont(
              //               'Montserrat',
              //               color: Colors.black,
              //               fontWeight: FontWeight.w600,
              //               fontSize: 15,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Align(
              //           alignment: AlignmentDirectional(1.00, 0.00),
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //               horizontal:
              //                   MediaQuery.of(context).size.width * 0.05,
              //               vertical:
              //                   MediaQuery.of(context).size.height * 0.005,
              //             ),
              //             child: CupertinoSwitch(
              //               value: _nofication,
              //               onChanged: (newValue) {
              //                 setState(() => _nofication = newValue!);
              //               },
              //               activeColor: Color(0xFF7D1F1F),
              //               trackColor: Color.fromRGBO(102, 102, 102, 100),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (1 / 14)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Contact();
                        }));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    // height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Text(
                          'Thông tin liên hệ',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (1 / 14)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return CustomTable();
                        }));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    // height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Text(
                          'Thông tin so sánh',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: login == true,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * (1 / 14)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Transcript();
                          }));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      // height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.05,
                            vertical:
                            MediaQuery.of(context).size.height * 0.03),
                        child: Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Text(
                            'Điểm số',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: login == false,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * (1 / 14),
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Esport();
                  }));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  // height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.03),
                    child: Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Text(
                        'Esport',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: login == true,
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      logindata.clear();
                      logindata.setBool('login', false);
                      Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MainPage(),
                              fullscreenDialog: true));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      'Đăng xuất',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: login == false,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * (1 / 14),
                  )),
              // Tạo khoảng trống giữa hình ảnh và các nút, đẩy các nút xuống dưới cùng
              Visibility(
                visible: login == false,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextButton(
                    child: Text(
                      'Đăng nhập',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(),
                              fullscreenDialog: true));
                    },
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF7D1F1F),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),

              Visibility(
                visible: login == false,
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    bottom: MediaQuery.of(context).size.height * 0.07,
                  ),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 45,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          // Điều chỉnh độ bo góc ở đây
                          side: BorderSide(
                            color: Color(0xFF7D1F1F), // Màu của viền
                            width: 2.0, // Độ dày của viền
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      'Đăng ký tư vấn du học',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Color(0xFF7D1F1F),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
