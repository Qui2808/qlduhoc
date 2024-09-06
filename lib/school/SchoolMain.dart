import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlduhoc/school/SchoolAbout.dart';
import 'package:qlduhoc/school/SchoolFacilities.dart';
import 'package:qlduhoc/school/SchoolIndustry.dart';
import 'package:qlduhoc/school/SchoolPartner.dart';
import 'package:qlduhoc/school/SchoolRequirement.dart';

import '../model/School.dart';

class SchoolMain extends StatefulWidget {
  final School schoolChild;

  SchoolMain({required this.schoolChild});

  @override
  State<SchoolMain> createState() => _SchoolMainState(schoolChild: schoolChild);
}

class _SchoolMainState extends State<SchoolMain> {
  final School schoolChild;

  _SchoolMainState({required this.schoolChild});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * (1 / 5)),
            child: AppBar(
              flexibleSpace: Image(
                image: NetworkImage(schoolChild.Logo.toString()),
                fit: BoxFit.cover,
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'GIỚI THIỆU',
                  ),
                  Tab(
                    text: 'NGÀNH',
                  ),
                  Tab(
                    text: 'CƠ SỞ',
                  ),
                  Tab(
                    text: 'YÊU CẦU',
                  ),
                  Tab(
                    text: 'ĐỐI TÁC',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SchoolAbout(historySchool: schoolChild.history![0]),
              // Navigator(
              //   onGenerateRoute: (settings) {
              //     Widget page = SchoolIndustry();
              //
              //     return MaterialPageRoute(builder: (_) => page);
              //   },
              // ),
              SchoolIndustry(program: schoolChild.programs!.toList()),
              SchoolFacilities(
                operation: schoolChild.operations!.toList(),
              ),
              SchoolRequirement(schoolRequirement: schoolChild.requirements![0]),
              SchoolPartner(),
            ],
          ),
        ),
      ),
    );
  }
}
