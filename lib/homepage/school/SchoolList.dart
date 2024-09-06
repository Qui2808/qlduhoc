import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlduhoc/school/SchoolMain.dart';

import 'package:qlduhoc/homepage/mainpage.dart';

import '../../model/School.dart';

class SchoolList extends StatelessWidget {
  // final String schoolChild;
  final School schoolChild;

  SchoolList({required this.schoolChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SchoolMain(schoolChild: schoolChild)));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Container(
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                schoolChild.Logo.toString(), //Link Assets img school.
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
