import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/model/data.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../homepage/mainpage.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = new TextEditingController();
  final RoundedLoadingButtonController loginController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              //
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Image.asset(
                        "assets/logo.png",
                        height: 124.0,
                        width: 220.0,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'QUÊN MẬT KHẨU',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.03),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Container(
                              width: 50,
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.grey,
                              )),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        '*Vui lòng nhập Email, hệ thống sẽ gửi cho bạn mã xác thực',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.3),
                      child: RoundedLoadingButton(
                        controller: loginController,
                        color: Colors.white,
                        successColor: Colors.black,
                        valueColor: Colors.black,
                        elevation: 0,
                        borderRadius: 30,
                        onPressed: () async {
                          int status = await ReadData().RequestForgotPass(
                              emailController.text.toString().trim());

                          loginController.reset();
                          if (status == 200) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(
                                      child: Text(
                                        'ĐÃ GỬI MAIL XÁC NHẬN',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Color(0XFF7D1F1F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    content: Text(
                                      'Vui lòng kiểm tra Mail (Bao gồm hòm thư spam)',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFF7D1F1F),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: TextButton(
                                            //Tắt hiệu ứng splash khi click button
                                            style: TextButton.styleFrom(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05),
                                              child: Text(
                                                'QUAY LẠI TRANG CHỦ',
                                                style: GoogleFonts.getFont(
                                                  'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPage()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(
                                      child: Text(
                                        'EMAIL KHÔNG TỒN TẠI',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Color(0XFF7D1F1F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    content: Text(
                                      'Vui lòng kiểm tra lại Mail',
                                      style: GoogleFonts.getFont(
                                        'Montserrat',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFF7D1F1F),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: TextButton(
                                            //Tắt hiệu ứng splash khi click button
                                            style: TextButton.styleFrom(
                                              splashFactory:
                                                  NoSplash.splashFactory,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05),
                                              child: Text(
                                                'QUAY LẠI TRANG CHỦ',
                                                style: GoogleFonts.getFont(
                                                  'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPage()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                        child: Text(
                          'TIẾP THEO',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Color(0XFF7D1F1F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
