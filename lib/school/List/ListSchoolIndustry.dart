import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/homepage/mainpage.dart';
import 'package:qlduhoc/school/Detail/DetailSchoolIndustry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SchoolMain.dart';

class ListSchoolIndustry extends StatefulWidget {
  final String schoolIndustryChild;
  final VoidCallback onTap;

  ListSchoolIndustry({required this.schoolIndustryChild, required this.onTap});

  @override
  State<ListSchoolIndustry> createState() => _ListSchoolIndustryState(schoolIndustryChild: schoolIndustryChild, onTap: onTap);
}

class _ListSchoolIndustryState extends State<ListSchoolIndustry> {
  final String schoolIndustryChild;
  final VoidCallback onTap;

  _ListSchoolIndustryState({required this.schoolIndustryChild, required this.onTap});

  late SharedPreferences themeMode;


  bool _thememode = false;
  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    themeMode = await SharedPreferences.getInstance();
    setState(() {
      _thememode = themeMode.getBool('theme') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.015),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: _thememode ? Color(0xFF5e5e5e): Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 0),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Text(
                  schoolIndustryChild,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: _thememode ? Colors.white: Color.fromRGBO(37, 60, 138, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
