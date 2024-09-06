import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/school/Detail/DetailSchoolIndustry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/School.dart';
import '../../model/data.dart';
import '../mainpage.dart';

class SearchPage extends StatefulWidget {
  final List<School> schoolData;

  SearchPage({required this.schoolData});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  List<Program> _data = [];

  List<Program> _filteredData = [];

  // bool _isLoading = false;

  late SharedPreferences themeMode;

  bool _thememode = false;

  @override
  void initState() {
    super.initState();
    AddListSchool(_data);
    _filteredData = _data;
    _searchController.addListener(_performSearch);
    initial();
  }

  void initial() async {
    themeMode = await SharedPreferences.getInstance();
    setState(() {
      _thememode = themeMode.getBool('theme') ?? false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      // _isLoading = true;
    });

    //Simulates waiting for an API call
    // await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredData = _data
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      // _isLoading = false;
    });
  }

  void AddListSchool(List<Program> _data) {
    // _data.add("Đại học Ngoại ngữ - Tin học TPHCM");
    // _data.add("Đại học Quốc gia Hà Nội");
    // _data.add("Đại học Quốc gia TP.HCM");
    // _data.add("Đại học Bách Khoa Hà Nội");
    // _data.add("Đại học Sư phạm Hà Nội");
    // _data.add("Đại học Ngoại thương");
    // _data.add("Đại học Khoa học Xã hội và Nhân văn TP.HCM");
    // _data.add("Đại học Khoa học Tự nhiên TP.HCM");
    // _data.add("Đại học Kinh tế TP.HCM");
    // _data.add("Đại học Công nghệ TP.HCM");
    // _data.add("Đại học Y Hà Nội");
    // _data.add("Đại học Y TP.HCM");
    // _data.add("Đại học Nông nghiệp Hà Nội");
    // _data.add("Đại học Nông nghiệp TP.HCM");
    // _data.add("Đại học Bách Khoa Đà Nẵng");
    // _data.add("Đại học Sư phạm Đà Nẵng");
    // print(_schoolData[0].programs![0].name!);

    for (int i = 0; i < widget.schoolData.length; i++) {
      for (int j = 0; j < widget.schoolData[i].programs!.length; j++) {
        widget.schoolData[i].programs![j].logo = widget.schoolData[i].Logo;
        _data.add(widget.schoolData[i].programs![j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _thememode ? Color(0xFF303030) : Colors.white,
          // toolbarHeight: 30,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: _thememode ? Colors.white : Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          title: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.001),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
              ),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: _searchController.clear,
                      icon: Icon(CupertinoIcons.clear_circled_solid)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: 'Nhập tên trường...',
              hintStyle: TextStyle(
                fontSize: 13,
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
          // actions: [
          //   Text(
          //     'Tìm kiếm',
          //     style: GoogleFonts.getFont(
          //       'Montserrat',
          //       color: Colors.black,
          //       fontWeight: FontWeight.w600,
          //       fontSize: 15,
          //     ),
          //   ),
          //   SizedBox(
          //     width: MediaQuery.of(context).size.width * 0.03,
          //   )
          // ],
        ),
        body:
            //Cái này là loading screen
            // _isLoading
            //     ? const Center(
            //   child: CircularProgressIndicator(color: Colors.black),
            // )
            //     :

            _filteredData.isEmpty ? _isNotFound() : _isFound());
  }

  Widget _isNotFound() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _thememode ? Color(0xFF303030) : Colors.white,
      child: Center(
        child: Text(
          "Không tìm thấy",
          style: GoogleFonts.getFont(
            'Montserrat',
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _isFound() {
    return Container(
        color: _thememode ? Color(0xFF303030) : Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: ListView.builder(
            itemCount: _filteredData.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailSchoolIndustry(
                              program: _filteredData[index])));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                            title: Text(
                          utf8.decode(_filteredData[index].name.toString().codeUnits),
                          style: TextStyle(
                              color: _thememode ? Colors.white : Colors.black),
                        )),
                      ),
                      Expanded(
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              height:50,
                              _filteredData[index].logo.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ],
                  ),
                )),
          ),
        ));
  }
}
