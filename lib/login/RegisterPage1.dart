import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:qlduhoc/login/LoginPage.dart';
import 'package:qlduhoc/login/RegisterMain.dart';
import 'package:qlduhoc/auth_bloc.dart';
import 'package:qlduhoc/main.dart';
import 'package:intl/intl.dart';
import 'package:qlduhoc/database.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage1 extends StatefulWidget {
  final VoidCallback onNextPage;

  RegisterPage1(
      {required this.onNextPage}); // callback để truyền thông tin từ RegisterPage1 đến RegisterPage

  @override
  _RegisterPage1State createState() =>
      _RegisterPage1State(onNextPage: onNextPage);
}

class _RegisterPage1State extends State<RegisterPage1> {
  final VoidCallback onNextPage; // Khai báo callback
  _RegisterPage1State(
      {required this.onNextPage}); // callback để truyền thông tin từ RegisterPage1 đến RegisterPage

  AuthBloc authBloc =
      new AuthBloc(); //kiểm tra và hiển thị lỗi trong các TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _cICController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final RoundedLoadingButtonController register1controller =
      RoundedLoadingButtonController();

  String? valueGender;

  String errorDate = "";
  FocusNode _dateFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  bool blockScreen = false;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      errorFormatText: 'Ngày không hợp lệ',
      errorInvalidText: 'Ngày không hợp lệ',
      initialEntryMode: DatePickerEntryMode.input,
    );
    if (picked != null && picked != selectedDate) {
      if (picked.isBefore(DateTime(DateTime.now().year - 17))) {
        // Ngày hợp lệ
        setState(() {
          selectedDate = picked;
          _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
          errorDate = "";
        });
      } else {
        setState(() {
          errorDate = "*Bạn phải đủ 18 tuổi";
        });
      }
    }
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  bool _obscureText =
      true; // Biến để theo dõi trạng thái của việc ẩn/hiện mật khẩu

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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                      child: StreamBuilder(
                          stream: authBloc.nameStream,
                          builder: (context, snapshot) => TextField(
                            cursorColor: Colors.primaryColor,
                            focusNode: authBloc
                                    .nameFocusNode, //focus đến textfield khi có lỗi
                            controller: _nameController,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  iconColor: Colors.primaryColor,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  errorStyle: TextStyle(color: Colors.white),
                                  labelText: "Họ và tên",
                                  prefixIcon: Container(
                                      width: 50, child: Icon(Icons.person, color: Colors.grey,)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
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
                      child: GestureDetector(
                        onTap: () => _selectDate(context), // Gọi hàm hiển thị lịch khi nhấn vào
                        child: AbsorbPointer(
                          child: TextFormField(
                            focusNode: _dateFocusNode,
                            controller: _dateController,
                            decoration: InputDecoration(
                              hintText: 'Ngày sinh',
                              filled: true,
                              fillColor: Colors.white,
                              errorText: errorDate != ""
                                  ? errorDate
                                  : null,
                              errorStyle: TextStyle(color: Colors.white),
                              prefixIcon: Container(
                                width: 50,
                                child: Icon(Icons.calendar_month),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 0),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () {

                                },
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: StreamBuilder(
                          stream: authBloc.phoneStream,
                          builder: (context, snapshot) => TextField(
                            cursorColor: Colors.primaryColor,
                            focusNode: authBloc
                                    .phoneFocusNode, //focus đến textfield khi có lỗi
                                keyboardType: TextInputType.number,
                                controller: _phoneController,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  iconColor: Colors.primaryColor,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  errorStyle: TextStyle(color: Colors.white),
                                  labelText: "Số điện thoại",
                                  prefixIcon: Container(
                                      width: 50, child: Icon(Icons.phone, color: Colors.grey,)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: StreamBuilder(
                          stream: authBloc.addressStream,
                          builder: (context, snapshot) => TextField(
                            cursorColor: Colors.primaryColor,
                            focusNode: authBloc
                                    .addressFocusNode, //focus đến textfield khi có lỗi
                                controller: _addressController,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  iconColor: Colors.primaryColor,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  errorStyle: TextStyle(color: Colors.white),
                                  labelText: "Địa chỉ",
                                  prefixIcon: Container(
                                      width: 50, child: Icon(Icons.map, color: Colors.grey,)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
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
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                      child: StreamBuilder(
                        stream: authBloc.genderStream,
                        builder: (context, snapshot) => DropdownButtonFormField<String>(
                          hint: Text('Giới tính', style: TextStyle(fontSize: 18),),
                          icon: null,
                          value: valueGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              valueGender = newValue;
                            });
                          },
                          items: <String>[
                            'Nam',
                            'Nữ',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            errorStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: StreamBuilder(
                          stream: authBloc.cICStream,
                          builder: (context, snapshot) => TextField(
                            cursorColor: Colors.primaryColor,
                            focusNode: authBloc
                                    .cICFocusNode, //focus đến textfield khi có lỗi
                                keyboardType: TextInputType.number,
                                controller: _cICController,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  iconColor: Colors.primaryColor,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  errorStyle: TextStyle(color: Colors.white),
                                  labelText: "CCCD",
                                  prefixIcon: Container(
                                      width: 50, child: Icon(Icons.credit_card, color: Colors.grey,)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
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
                          stream: authBloc.emailStream,
                          builder: (context, snapshot) => TextField(
                            cursorColor: Colors.primaryColor,
                            focusNode: authBloc
                                    .emailFocusNode, //focus đến textfield khi có lỗi
                                controller: _emailController,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  errorStyle: TextStyle(color: Colors.white),
                                  labelText: "Email",
                                  prefixIcon: Container(
                                      width: 50,
                                      child: Icon(Icons.email_outlined, color: Colors.grey,)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
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
                        stream: authBloc.passStream,
                        builder: (context, snapshot) => TextField(
                          cursorColor: Colors.primaryColor,
                          focusNode: authBloc
                              .passFocusNode, //focus đến textfield khi có lỗi
                          controller: _passController,
                          obscureText:
                              _obscureText, // Sử dụng biến để ẩn/hiện mật khẩu
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            errorStyle: TextStyle(color: Colors.white),
                            labelText: "Mật khẩu",
                            prefixIcon:
                                Container(width: 50, child: Icon(Icons.password, color: Colors.grey,)),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off, color: Colors.primaryColor,),
                              onPressed: () {
                                // Khi nhấn vào IconButton, chuyển đổi giữa ẩn/hiện mật khẩu
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
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
                        width: 150,
                        elevation: 0,
                        borderRadius: 30,
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            blockScreen = true;
                          });
                          await _onNextClick();
                        },
                        child: Text(
                          "Tiếp theo",
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
                            style: TextStyle(color: Colors.white70, fontSize: 16),
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

  Future<void> _onNextClick() async {
    String name = _nameController.text;
    String date = _dateController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;
    String cic = _cICController.text;
    String email = _emailController.text;
    String pass = _passController.text;

    var isValid =
        authBloc.isValid(name, date, phone, address, valueGender == null ? "" : valueGender!, cic, email, pass);

    if (await isValid) {
      if(_dateController.text.trim() == ""){
        setState(() {
          errorDate = "*Nhập ngày sinh";
          // _dateFocusNode.requestFocus();
          blockScreen = false;
        });
        register1controller.reset();
        return;
      }
      onNextPage();
    }
    setState(() {
      blockScreen = false;
    });
    register1controller.reset();
  }
}
