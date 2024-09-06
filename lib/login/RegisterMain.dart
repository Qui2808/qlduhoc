import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:qlduhoc/login/LoginPage.dart';
import 'package:qlduhoc/login/RegisterPage1.dart';
import 'package:qlduhoc/login/RegisterPage2.dart';
import 'package:qlduhoc/auth_bloc.dart';
import 'package:qlduhoc/main.dart';
import 'package:intl/intl.dart';

import 'package:qlduhoc/database.dart';
import 'package:flutter/material.dart';

import '../model/School.dart';
import '../model/data.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();
  late List<Widget> pages;
  bool shouldNavigate = true;
  int currentPage = 0;

  List<String> listSchool = [];

  @override
  void initState() {
    super.initState();
    getSchool();
  }
  @override
  void dispose() {
    // Hủy bỏ PageController khi không cần sử dụng nữa
    _pageController.dispose();
    super.dispose();
  }

  void getSchool() async {
    List<School> school = await ReadData().ListSchool();
    for(var item in school){
      listSchool.add(utf8.decode(item.Name!.toString().codeUnits));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Color(0xFF7D1F1F),
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                  child:SizedBox(
                    height: 140,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "ĐĂNG KÝ HỒ SƠ",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                RegisterPage1(
                  onNextPage: () {
                    if (currentPage == 0) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                RegisterPage2(lstSchool: listSchool),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void nextPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
