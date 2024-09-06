import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/homepage/mainpage.dart';

import '../../model/data.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();

  void ClearData() {
    _nameController.clear();
    _emailController.clear();
    _phoneNumberController.clear();
    _contentController.clear();
  }

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
          'Liên hệ với chúng tôi',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.03,
                bottom: MediaQuery.of(context).size.height * 0.03 * 3,
              ),
              //Box tổng
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    //Box viền 1
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Color.fromRGBO(217, 217, 217, 1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        child: Column(
                          children: [
                            //Box con 1
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Văn phòng miền Nam: ',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            'Tầng 75 Landmark 81, 720A Đ. Điện Biên Phủ, Vinhomes Tân Cảng, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(CupertinoIcons.phone),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Hotline: ',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            '(024) 37777777\n             (098) 8888888',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Văn phòng miền Bắc: ',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            ' 5 P. Hoàng Văn Thụ, Quán Thánh, Ba Đình, Hà Nội, Việt Nam',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(CupertinoIcons.phone),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Hotline: ',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            '(024) 3999999\n             (098) 9999999',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Theme.of(context).primaryColor,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(217, 217, 217, 1)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromRGBO(200, 200, 200, 1)),
                        ),
                        hintText: 'Họ và tên',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                            MediaQuery.of(context).size.width * 0.012,
                            horizontal:
                            MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(217, 217, 217, 1)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromRGBO(200, 200, 200, 1)),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                            MediaQuery.of(context).size.width * 0.012,
                            horizontal:
                            MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(217, 217, 217, 1)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromRGBO(200, 200, 200, 1)),
                        ),
                        hintText: 'Số điện thoại',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                            MediaQuery.of(context).size.width * 0.012,
                            horizontal:
                            MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: TextFormField(
                      controller: _contentController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(217, 217, 217, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromRGBO(200, 200, 200, 1)),
                        ),
                        hintText: 'Nội dung cần tư vấn',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      maxLines: 4,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.05,
                    ),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF7D1F1F),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: TextButton(
                      //Tắt hiệu ứng splash khi click button
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        'Liên hệ',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () async {
                        bool success = await ReadData().AddContact(
                          _nameController.text,
                          _emailController.text,
                          _phoneNumberController.text,
                          _contentController.text,
                        );

                        if (success) {
                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Thành công"),
                                content: Text("Cảm ơn bạn đã liên hệ cho chúng tôi. Liên hệ của bạn sẽ được phản hồi trong khoảng 2 đến 3 ngày."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                      ClearData();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Show failure dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Lỗi"),
                                content: Text("Không thể gửi liên hệ. Vui lòng thử lại."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

