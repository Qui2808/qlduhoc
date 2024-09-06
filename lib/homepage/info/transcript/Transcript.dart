import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transcript extends StatefulWidget {
  const Transcript({super.key});

  @override
  State<Transcript> createState() => _TranscriptState();
}

class _TranscriptState extends State<Transcript> {
  // Sample data list containing names and scores
  final List<Map<String, dynamic>> dataList = [
    {
      'Môn': 'Nhập môn lập trình',
      'Mini Test 1': 10,
      'Mini Test 2': 8,
      'Mini Test 3': 10,
      'GK': 6,
      'CK': 9,
      'TBM': 8.6
    },
    {
      'Môn': 'Kỹ thuật lập trình',
      'Mini Test 1': 7,
      'Mini Test 2': 9,
      'Mini Test 3': 10,
      'GK': 8,
      'CK': 7,
      'TBM': 7.5
    },
    {
      'Môn': 'Hệ điều hành',
      'Mini Test 1': 4,
      'Mini Test 2': 5,
      'Mini Test 3': 7,
      'GK': 8,
      'CK': 8,
      'TBM': 7.3
    },
  ];

  final List<String> _schoolYears = [
    '2023 - 2024',
    '2022 - 2023',
    '2021 - 2022',
    '2020 - 2021',
    '2019 - 2020',
  ];

  final List<String> _semester = [
    'Học kỳ 1',
    'Học kỳ 2',
    'Học kỳ 3',
  ];

  String? selectedSchoolYearValue;
  String? selectedSemesterValue;

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
          'Điểm số',
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
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Chọn năm học',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: _schoolYears
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedSchoolYearValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedSchoolYearValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Chọn học kỳ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: _semester
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedSemesterValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedSemesterValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02),
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Row(
            children: [
              Container(
                child: DataTable(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Môn học')),
                  ],
                  rows: dataList.map((data) {
                    return DataRow(cells: <DataCell>[
                      DataCell(Text(data['Môn'])),
                    ]);
                  }).toList(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DataTable(
                        border: const TableBorder(
                          top: BorderSide(width: 1.0, color: Colors.black),
                          right: BorderSide(width: 1.0, color: Colors.black),
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                          horizontalInside: BorderSide(width: 1.0, color: Colors.black),
                          verticalInside: BorderSide(width: 1.0, color: Colors.black),
                        ),
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text('Mini Test'),
                            numeric: true,
                          ),
                          DataColumn(label: Text('GK')),
                          DataColumn(label: Text('CK')),
                          DataColumn(label: Text('TBM')),
                        ],
                        rows: dataList.map((data) {
                          return DataRow(cells: <DataCell>[
                            DataCell(
                              Row(
                                children: [
                                  Text(data['Mini Test 1'].toString()),
                                  Text(' | '),
                                  Text(data['Mini Test 2'].toString()),
                                  Text(' | '),
                                  Text(data['Mini Test 3'].toString()),
                                ],
                              ),
                            ),
                            DataCell(Text(data['GK'].toString())),
                            DataCell(Text(data['CK'].toString())),
                            DataCell(Text(data['TBM'].toString())),
                          ]);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
