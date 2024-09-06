import 'package:fluttertoast/fluttertoast.dart';
import 'package:qlduhoc/login/LoginPage.dart';
import 'package:qlduhoc/auth_bloc.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:qlduhoc/database.dart';
import 'package:flutter/material.dart';
import 'package:qlduhoc/model/School.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../model/data.dart';

class RegisterPage2 extends StatefulWidget {
  final List<String> lstSchool;

  RegisterPage2(
      {required this.lstSchool});

  @override
  _RegisterPage2State createState() => _RegisterPage2State(lstSchool: lstSchool);
}

class _RegisterPage2State extends State<RegisterPage2> {
  final List<String> lstSchool;

  _RegisterPage2State(
      {required this.lstSchool});

  AuthBloc authBloc =
      new AuthBloc(); //kiểm tra và hiển thị lỗi trong các TextField
  String? selectedValue;
  String? selectedValue2;
  String? selectedEng;
  bool blockScreen = false;

  final TextEditingController _gpaController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final RoundedLoadingButtonController register1controller =
      RoundedLoadingButtonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IgnorePointer(
        ignoring: blockScreen, // Đặt thành true để vô hiệu hóa tương tác
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  // Thay đổi đường dẫn hình ảnh nền của bạn
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              constraints: BoxConstraints.expand(),
              color: Color(0x00000000),
              // Đặt màu nền trong suốt để hình ảnh nền hiển thị
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 10),
                      child: Text(
                        'Thông tin chứng chỉ',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                        child: DropdownButtonFormField<String>(
                          hint: Text('Trình độ học tập'),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          items: <String>[
                            'Tốt nghiệp THPT',
                            'Tốt nghiệp cao đẳng',
                            'Tốt nghiệp đại học'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            filled:
                                true, // Để làm cho hộp nhập tràn đầy màu nền
                            fillColor: Colors.white, // Đổi màu nền thành trắng
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30.0), // Bo góc với bán kính 10.0
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                        child: DropdownButtonFormField<String>(
                          hint: Text('Chọn trường'),
                          value: selectedValue2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue2 = newValue;
                            });
                          },
                          items: lstSchool.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            filled:
                                true, // Để làm cho hộp nhập tràn đầy màu nền
                            fillColor: Colors.white, // Đổi màu nền thành trắng
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30.0), // Bo góc với bán kính 10.0
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                        child: DropdownButtonFormField<String>(
                          hint: Text('Chứng chỉ ngoại ngữ'),
                          value: selectedEng,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedEng = newValue;
                            });
                          },
                          items: <String>[
                            'TOEFL',
                            'IELTS',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            filled:
                                true, // Để làm cho hộp nhập tràn đầy màu nền
                            fillColor: Colors.white, // Đổi màu nền thành trắng
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30.0), // Bo góc với bán kính 10.0
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: StreamBuilder(
                          stream: authBloc.gpaStream,
                          builder: (context, snapshot) => TextField(
                            cursorColor: Colors.primaryColor,
                            keyboardType: TextInputType.number,
                                controller: _gpaController,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  labelText: "GPA",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                    // Đặt màu nền khi TextField được chọn
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 3.0,
                                    ),
                                    // Đặt bo góc khi TextField được chọn
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: StreamBuilder(
                        stream: authBloc.desStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: Colors.primaryColor,
                          controller: _desController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          maxLines: 3,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            errorText: snapshot.hasError ? snapshot.error.toString() : null,
                            labelText: "Mô tả lý do du học",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 3.0),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                      child: RoundedLoadingButton(
                        controller: register1controller,
                        color: Colors.white,
                        valueColor: Colors.primaryColor,
                        successColor: Colors.primaryColor,
                        width: 200,
                        elevation: 0,
                        borderRadius: 30,
                        onPressed: () async {
                          setState(() {
                            blockScreen = true;
                          });
                          await _onLogUpClick(context);
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                              color: Color.fromRGBO(125, 31, 31, 1.0),
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Đã có tài khoản? ",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Đăng nhập",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onLogUpClick(BuildContext context) async {
    String schoolCate = "";
    if (selectedValue == "Tốt nghiệp THPT") {
      schoolCate = "THPT";
    } else if (selectedValue == "Tốt nghiệp cao đẳng") {
      schoolCate = "CAODANG";
    } else if (selectedValue == "Tốt nghiệp đại học") {
      schoolCate = "DAIHOC";
    }

    String gpa = _gpaController.text;
    String des = _desController.text;

    if (selectedEng == null || selectedValue == null || selectedValue2 == null || gpa.isEmpty || des.isEmpty) {
      await Fluttertoast.showToast(
          msg: "Điền đầy đủ thông tin",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Color(0xFF7D1F1F),
          fontSize: 16.0);
      setState(() {
        blockScreen = false;
      });
      register1controller.reset();
      return;
    }

    authBloc
        .isValid2(schoolCate, selectedValue2!, selectedEng!, gpa, des)
        .then((value) async => {
              if (value == true)
                {
                  await Fluttertoast.showToast(
                      msg: "Đăng kí thành công!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Color(0xFF7D1F1F),
                      fontSize: 16.0),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                }
              else
                {
                  setState(() {
                    blockScreen = false;
                  }),
                  register1controller.reset(),
                }
            });
  }
}
