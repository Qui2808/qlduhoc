import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/school/List/ListSchoolFacilities.dart';

import '../model/School.dart';

class SchoolFacilities extends StatelessWidget {
  final List<Operation> operation;

  SchoolFacilities({required this.operation});

  final List _schoolFacilitiesName = [
    'Seymore',
    'West Hastings',
    'Granville',
    'Gastown',
  ];

  final List _schoolFacilitiesDescription = [
    'Cơ sở 3 nằm trong vùng trung tâm của Vancouver',
    'Cơ sở 1 năm trong vùng trung tâm của Vancouver',
    'Cơ sở 2 nằm trong vùng trung tâm của Vancouver',
    'Cơ sở 4 đang xây dựng trong khu phố cổ của Vancouver',
  ];

  final List _schoolFacilitiesImage = [
    'assets/banner/Cornerstone.jpg',
    'assets/banner/Metropolitan.jpg',
    'assets/banner/Canada.jpg',
    'assets/banner/Valeey.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: operation.length,
          itemBuilder: (context, index) {
            return ListSchoolFacilities(
              schoolFacilitiesNameChild: operation[index].name.toString(),
              schoolFacilitiesDescriptionChild:
                  operation[index].description.toString(),
              schoolFacilitiesImageChild:
                  operation[index].backgroundurl.toString(),
            );
          }),
    );
  }
}
