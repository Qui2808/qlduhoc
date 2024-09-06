import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:qlduhoc/login/ForgotPasswordPage.dart';
import 'package:qlduhoc/login/RegisterMain.dart';
import 'package:qlduhoc/homepage/info/SettingPage.dart';
import 'package:qlduhoc/homepage/mainpage.dart';
import 'package:qlduhoc/model/data.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/User.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  final RoundedLoadingButtonController loginController =
  RoundedLoadingButtonController();

  late SharedPreferences logindata;
  late bool newuser;

  // bool _isChecked = false;
  bool _obscureText = true;

  bool _isLoginSuccess = false;

  List<User> lstUser = [];

  void getUser() async {
    lstUser = await ReadData().ListUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Future login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   if (userController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  //     String username = userController.text.toString().trim();
  //     String password = passwordController.text.toString().trim();
  //
  //     for (var item in lstUser) {
  //       bool correct = BCrypt.checkpw(password, "${item.pass}");
  //       //bool correct = true;
  //       print("vo duoc foreach");
  //       if (username == item.email && correct && _isChecked) {
  //         await logindata.setBool('login', true);
  //         await logindata.setString('username', item.name.toString());
  //         await logindata.setString('avatar', item.avatar.toString());
  //         await logindata.setString('email', item.email.toString());
  //         _isLoginSuccess = false;
  //         _isLoading = false;
  //         // setState(() {
  //         //
  //         // });
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (_) => MainPage()));
  //         break;
  //       } else if (username == item.email && correct && !_isChecked) {
  //         await logindata.setBool('login', false);
  //         await logindata.setString('username', item.name.toString());
  //         await logindata.setString('avatar', item.avatar.toString());
  //         await logindata.setString('email', item.email.toString());
  //         _isLoginSuccess = false;
  //         _isLoading = false;
  //         // setState(() {
  //         //
  //         // });
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (_) => MainPage()));
  //       } else {
  //         // setState(() {
  //         //
  //         // });
  //         _isLoginSuccess = true;
  //         _isLoading = false;
  //       }
  //     }
  //
  //     // if (isLoggedin && !_isChecked) {
  //     //   logindata.setBool('login', false);
  //     //   logindata.setString('username', username);
  //     //
  //     //
  //     //
  //     //   setState(() {
  //     //     _isLoginSuccess = false;
  //     //   });
  //     //
  //     //   Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  //     // } else if (isLoggedin && _isChecked) {
  //     //   logindata.setBool('login', true);
  //     //   logindata.setString('username', username);
  //     //
  //     //   setState(() {
  //     //     _isLoginSuccess = false;
  //     //   });
  //     //
  //     //   Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  //     // } else {
  //     //   setState(() {
  //     //     _isLoginSuccess = true;
  //     //   });
  //     // }
  //   } else {
  //     loginController.reset();
  //     setState(() {
  //       _isLoginSuccess = true;
  //       _isLoading = false;
  //     });
  //   }
  // }

  Future login() async {
    logindata = await SharedPreferences.getInstance();
    if (userController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      String username = userController.text.toString().trim();
      String password = passwordController.text.toString().trim();

      for (var item in lstUser) {
        print("vo duoc foreach");
        if (username == item.email) {
          username = item.email.toString();
          bool correct = BCrypt.checkpw(password, "${item.pass}");
          if (correct) {
            logindata.setBool('login', true);
            logindata.setString('avatar', item.avatar.toString());
            logindata.setString('username', item.name.toString());
            logindata.setString('dob', item.dob.toString());
            logindata.setString('address', item.address.toString());
            logindata.setString('phone', item.phoneNumber.toString());
            logindata.setString('gender', item.gender.toString());
            logindata.setString('email', item.email.toString());
            logindata.setString('cccd', item.cccd.toString());
            setState(() {
              _isLoginSuccess = false;
            });

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MainPage()));
            break;
          } else {
            setState(() {
              _isLoginSuccess = true;
            });
          }
        } else {
          setState(() {
            _isLoginSuccess = true;
          });
        }
      }
    } else {
      loginController.reset();
      setState(() {
        _isLoginSuccess = true;
      });
    }
  }

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
                      highlightColor:  Colors.transparent,
                      child: Image.asset(
                        "assets/logo.png",
                        height: 124.0,
                        width: 220.0,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'ĐĂNG NHẬP',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Vui lòng đăng nhập để tiếp tục',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          MediaQuery.of(context).size.height * 0.03),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: TextFormField(
                        controller: userController,
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
                              child: Icon(Icons.email_outlined, color: Colors.grey,)),
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
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          MediaQuery.of(context).size.height * 0.03),
                      child: TextFormField(
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          errorText: _isLoginSuccess
                              ? 'Sai tài khoản hoặc mật khẩu'
                              : null,
                          errorStyle:
                          TextStyle(color: Colors.white, fontSize: 12),
                          prefixIcon:
                          Container(width: 50, child: Icon(Icons.password, color: Colors.grey,)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _obscureText
                                  ? Colors.grey
                                  : Color.fromRGBO(
                                  125, 31, 31, 100), // Change icon color
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Mật khẩu',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: AlignmentDirectional(-1.00, 0.00),
                    //   child: Padding(
                    //     padding: EdgeInsetsDirectional.fromSTEB(19, 5, 0, 0),
                    //     child: Row(
                    //       children: [
                    //         Theme(
                    //           data: ThemeData(
                    //             unselectedWidgetColor: Colors.white,
                    //             // visualDensity: VisualDensity.compact,
                    //             // materialTapTargetSize:
                    //             //     MaterialTapTargetSize.shrinkWrap,
                    //           ),
                    //           child: Checkbox(
                    //             value: _isChecked,
                    //             onChanged: (bool? newValue) {
                    //               setState(() {
                    //                 _isChecked = newValue!;
                    //               });
                    //             },
                    //             activeColor: Colors.white,
                    //             checkColor: Colors.red,
                    //           ),
                    //         ),
                    //         Text(
                    //           'Ghi nhớ mật khẩu',
                    //           style: GoogleFonts.getFont(
                    //             'Montserrat',
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 12,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                    //   margin: EdgeInsets.only(top: 20.0),
                    //   child: TextButton(
                    //     child: Text(
                    //       'ĐĂNG NHẬP',
                    //       style: GoogleFonts.getFont(
                    //         'Montserrat',
                    //         color: Color.fromRGBO(125, 31, 31, 100),
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       login();
                    //     },
                    //   ),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(20.0)),
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
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
                        onPressed: () {
                          //login(context, userName.text.trim());
                          //loginController.success();

                          login();
                          loginController.reset();
                          print('object');
                        },
                        child: Text(
                          'ĐĂNG NHẬP',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Color(0xFF7D1F1F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // onPressed: () {
                        //   setState(() {
                        //     _isLoading = true;
                        //   });
                        //   login();
                        // },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForgotPasswordPage()));
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Quên mật khẩu?',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bạn chưa có tài khoản?',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterPage()));
                            },
                            child: Text(
                              'Đăng kí ngay',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
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
