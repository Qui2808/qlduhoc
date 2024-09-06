import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:qlduhoc/model/User.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:http/http.dart' as http;

import 'database.dart';
import 'model/data.dart';

User userRes1 = User.none();

class AuthBloc {
  DBHelper dbHelper = new DBHelper();
  StreamController _nameController = new StreamController();
  StreamController _dateController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _addressController = new StreamController();
  StreamController _genderController = new StreamController();
  StreamController _cICController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  StreamController _gpaController = new StreamController();
  StreamController _desController = new StreamController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  FocusNode _genderFocusNode = FocusNode();
  FocusNode _cICFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();

  FocusNode get phoneFocusNode => _phoneFocusNode;

  FocusNode get addressFocusNode => _addressFocusNode;

  FocusNode get genderFocusNode => _genderFocusNode;

  FocusNode get cICFocusNode => _cICFocusNode;

  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode get passFocusNode => _passFocusNode;

  FocusNode get nameFocusNode => _nameFocusNode;

  Stream get nameStream => _nameController.stream;

  // Stream get dateStream => _dateController.stream;
  Stream get phoneStream => _phoneController.stream;

  Stream get addressStream => _addressController.stream;

  Stream get genderStream => _genderController.stream;

  Stream get cICStream => _cICController.stream;

  Stream get emailStream => _emailController.stream;

  Stream get passStream => _passController.stream;

  Stream get gpaStream => _gpaController.stream;

  Stream get desStream => _desController.stream;

  List<User> lstUser = [];

  Future<void> getUser() async {
    lstUser = await ReadData().ListUser();
  }

  Future<bool> isValid(String name, String dob, String phone, String address,
      String gender, String cic, String email, String pass) async {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("*Nhập họ tên");
      _nameFocusNode.requestFocus();
      return false;
    }
    _nameController.sink.add("");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("*Nhập số điện thoại");
      _phoneFocusNode.requestFocus();
      return false;
    }
    _phoneController.sink.add("");

    if (phone.length != 10) {
      _phoneController.sink.addError("*Số điện thoại gồm 10 kí tự");
      _phoneFocusNode.requestFocus();
      return false;
    }
    _phoneController.sink.add("");

    if (address == null || address.length == 0) {
      _addressController.sink.addError("*Nhập địa chỉ");
      _addressFocusNode.requestFocus();
      return false;
    }
    _addressController.sink.add("");

    if (!(gender == "Nam" || gender == "Nữ")) {
      _genderController.sink.addError("*Vui lòng chọn giới tính ");
      _genderFocusNode.requestFocus();
      return false;
    }
    _genderController.sink.add("");

    if (cic == null || cic.length < 9) {
      _cICController.sink.addError("*CCCD phải từ 9 chữ số");
      _cICFocusNode.requestFocus();
      return false;
    }
    _cICController.sink.add("");

    RegExp emailRegex = RegExp(
        r'.+@.+'); // Biểu thức chính quy kiểm tra có ít nhất một ký tự trước và sau ký tự '@'
    if (email == null || !emailRegex.hasMatch(email)) {
      _emailController.sink.addError("*Email không hợp lệ");
      _emailFocusNode.requestFocus();
      return false;
    }
    _emailController.sink.add("");

    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp digitRegex = RegExp(r'\d');
    RegExp specialCharRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

    bool isPasswordValid = uppercaseRegex.hasMatch(pass) &&
        lowercaseRegex.hasMatch(pass) &&
        digitRegex.hasMatch(pass) &&
        specialCharRegex.hasMatch(pass) &&
        pass.length >= 10;

    if (!isPasswordValid) {
      _passController.sink.addError(
          "*Từ 10 kí tự( gồm chữ cái hoa, thường, số và kí tự đặc biệt");
      _passFocusNode.requestFocus();
      return false;
    }
    _passController.sink.add("");

    userRes1 = User.none();
    userRes1 = User.Register1(
        name: name,
        dob: dob,
        phoneNumber: phone,
        address: address,
        gender: gender,
        cccd: cic,
        email: email,
        pass: pass);

    await getUser();

    for (var item in lstUser) {
      if (email == item.email) {
        _emailController.sink.addError("*Email đã được đăng kí");
        _emailFocusNode.requestFocus();
        return false;
      }
      if (cic == item.cccd) {
        _cICController.sink.addError("*CCCD đã được đăng kí!");
        _cICFocusNode.requestFocus();
        return false;
      }
    }

    return true;
  }

  Future<bool> isValid2(String schoolCate, String schoolName, String eng,
      String gpa, String des) async {
    // if (gpa == null || gpa.length == 0) {
    //   _gpaController.sink.addError("*Nhập GPA");
    //   return false;
    // }
    // _gpaController.sink.add("");
    //
    // if (des == null || des.length == 0) {
    //   _desController.sink.addError("*Nhập mô tả");
    //   return false;
    // }
    // _desController.sink.add("");

    print("cccd " + userRes1.cccd.toString());
    print("email: " + userRes1.email.toString());
    print("school: " + schoolCate.toString());
    print("eng: " + eng.toString());

    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(userRes1.dob!);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDate);

    print(formattedDate);

    // String pass = BCrypt.hashpw(userRes1.pass!, BCrypt.gensalt(logRounds: 12));
    DateTime now = DateTime.now();
    String dateNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    final response = await http.post(
      Uri.parse('https://admin-duhocsinhcanada.vercel.app/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": userRes1.name,
        "password": userRes1.pass,
        "email": userRes1.email,
        "role": "USER",
        "gender": userRes1.gender,
        "description": des,
        "dob": formattedDate,
        "emailVerified": "",
        "address": userRes1.address,
        "phoneNumber": userRes1.phoneNumber,
        "schoolName": "Cornerstone 2",
        "cccd": userRes1.cccd,
        "isPublished": false,
        "studyCategory": "",
        "schoolCategory": schoolName,
        "certificateCategory": eng,
        "createdAt": dateNow,
        "updatedAt": dateNow,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
    } else {
      print("statusCode " + response.statusCode.toString());
      await showToast("Đăng kí thất bại!");
      return false;
    }

    return true;
  }

  void errorEmailExist() {
    _emailController.sink.addError("*Email đã được sử dụng");
  }

  void dispose() {
    _emailController.close();
    _phoneController.close();
    _addressController.close();
    _genderController.close();
    _cICController.close();
    _emailController.close();
  }

  Future<void> showToast(String msg) async {
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Color(0xFF7D1F1F),
        fontSize: 16.0);
  }
}
