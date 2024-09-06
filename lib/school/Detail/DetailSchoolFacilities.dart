import 'package:flutter/cupertino.dart';

class DetailSchoolFacilities extends StatelessWidget {
  final String schoolFacilitiesNameChild;
  final String schoolFacilitiesDescriptionChild;
  final String schoolFacilitiesImageChild;

  DetailSchoolFacilities(
      {required this.schoolFacilitiesNameChild,
        required this.schoolFacilitiesDescriptionChild,
        required this.schoolFacilitiesImageChild});


  @override
  Widget build(BuildContext context) {
    return Text(schoolFacilitiesNameChild);
  }
}
