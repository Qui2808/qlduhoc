import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlduhoc/homepage/school/SchoolList.dart';
import 'package:http/http.dart' as http;

import '../../model/School.dart';


class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  // final List _schools = [
  //   'assets/banner/Cornerstone.jpg',
  //   'assets/banner/Metropolitan.jpg',
  //   'assets/banner/Canada.jpg',
  //   'assets/banner/Valeey.jpg',
  //   'assets/banner/Sprott.jpg',
  // ];

  List<School> _schoolData = [];

  late List<School> _schools;

  Future<void> getSchool() async {
    // _schoolData = await ReadData().ListSchool();
    final response = await http
        .get(Uri.parse('https://admin-duhocsinhcanada.vercel.app/api/schools'));
    _schoolData = School.parseList(response);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSchool();
  }

  @override
  Widget build(BuildContext context) {
    if (_schoolData.isEmpty) {
      // Show a loading indicator
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor)),
        ),
      );
    } else {
      // Show the list of schools
      return Scaffold(
        body: ListView.builder(
          itemCount: _schoolData.length,
          itemBuilder: (context, index) {
            return SchoolList(schoolChild: _schoolData[index]);
          },
        ),
      );
    }
  }
}
