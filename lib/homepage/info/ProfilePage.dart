import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences logindata;

  String username = "";
  String dob = "";
  String address = "";
  String phone = "";
  String gender = "";
  String email = "";
  String cccd = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();

    username = await logindata.getString('username') ?? "";
    username = utf8.decode(username.codeUnits);

    dob = await logindata.getString('dob') ?? "";
    dob = utf8.decode(dob.codeUnits);

    address = await logindata.getString('address') ?? "";
    address = utf8.decode(address.codeUnits);

    phone = await logindata.getString('phone') ?? "";
    phone = utf8.decode(phone.codeUnits);

    gender = await logindata.getString('gender') ?? "";
    gender = utf8.decode(gender.codeUnits);

    email = await logindata.getString('email') ?? "";
    email = utf8.decode(email.codeUnits);

    cccd = await logindata.getString('cccd') ?? "";
    cccd = utf8.decode(cccd.codeUnits);


    if(dob != ""){
      DateTime dateTime = DateTime.parse(dob);
      String formattedDateString = DateFormat('dd/MM/yyyy').format(dateTime);
      dob = formattedDateString;
    }

    if(!mounted)
      return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.primaryColor,
        centerTitle: true,
        title: Text(
          'THÔNG TIN SINH VIÊN',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                  child: Align(
                    child: Image.asset(
                      'assets/banner/HomeSlider2.jpg',
                      width: maxWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
              ),

              Positioned(
                top: 110,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    alignment: Alignment.topCenter,
                    width: maxWidth - 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: maxWidth - 100,
                            height: 48,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Họ và tên:    ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: username,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000), // Màu của phần email
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: maxWidth - 100,
                            height: 48,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Ngày sinh:    ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: dob,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000), // Màu của phần email
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: maxWidth - 100,
                            height: 48,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Di động:    ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: phone,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000), // Màu của phần email
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: maxWidth - 100,
                            height: 48,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Giới tính:    ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: gender,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000), // Màu của phần email
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: maxWidth - 100,
                            height: 48,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'CCCD/CMND:    ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: cccd,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000), // Màu của phần email
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: maxWidth - 100,
                            height: 48,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Email:    ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: email,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff000000), // Màu của phần email
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 40),
                          child: Container(
                            padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                            alignment: Alignment.topLeft,
                            width: maxWidth - 100,
                            height: 80,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Color(0xff000000)),
                              color: Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Địa chỉ:    ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: address,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff000000), // Màu của phần email
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: maxWidth,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/img.png',
                      width: 180,
                      fit: BoxFit.cover,
                    ),
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
