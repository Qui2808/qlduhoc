import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'TableDataHelper.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

// DataTable
// ScrollController
// Row
// Column

class _CustomTableState extends State<CustomTable> {
  // ScrollGroupController,
  // To Scroll the multiple scroll-view in sync using controller
  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();

  late List<String> firstColumnList = SchoolColumnHelper.firstColumn;

  ScrollController? headerScrollController;
  ScrollController? dataScrollController;

  @override
  void initState() {
    super.initState();
    headerScrollController = controllerGroup.addAndGet();
    dataScrollController = controllerGroup.addAndGet();
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
          'Thông tin so sánh',
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
      body: SafeArea(
        child: Stack(
          children: [
            tableContent(),
            tableHeader(),
          ],
        ),
      ),
    );
  }

  Widget tableContent() {
    return SingleChildScrollView(
      child: Row(
        children: [
          DataTable(
            columns: TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
              return DataColumn(
                label: SizedBox(
                  width: MediaQuery.of(context).size.width * 3/8,
                  child: Text(''),
                ),
              );
            }).toList(),
            rows: List.generate(firstColumnList.length, (index) {
              return DataRow(cells: [
                DataCell(
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 3/8,
                    child: Text(
                      firstColumnList[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ]);
            }),
            headingRowColor: MaterialStateProperty.all(Colors.green),
            dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
          ), // start
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: dataScrollController,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.blue),
                dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
                columns: TableDataHelper.kTableColumnsList
                    .getRange(0, TableDataHelper.kTableColumnsList.length)
                    .map((e) {
                  return DataColumn(
                    label: SizedBox(
                      width: MediaQuery.of(context).size.width * 3/12,
                      child: Text(''),
                    ),
                  );
                }).toList(),
                rows: generateDataRows(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableHeader() {
    return Row(
      children: [
        DataTable(
          columns: TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
            return DataColumn(
              label: SizedBox(
                width: MediaQuery.of(context).size.width * 3/8,
                child: Text(''),
              ),
            );
          }).toList(),
          rows: const [],
          headingRowColor: MaterialStateProperty.all(Colors.green),
          dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
        ), // start
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: headerScrollController,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.blue),
              dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
              columns: TableDataHelper.kTableColumnsList
                  .getRange(0, TableDataHelper.kTableColumnsList.length)
                  .map((e) {
                return DataColumn(
                  label: SizedBox(
                    width: MediaQuery.of(context).size.width * 3/12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(e.schoolImg.toString()),
                    ),
                  ),
                );
              }).toList(),
              rows: const [],
            ),
          ),
        ),
      ],
    );
  }

  List<DataRow> generateDataRows() {
    List<DataRow> dataRows = [];

    for (int j = 0; j < firstColumnList.length; j++) {
      // Assuming you have 12 rows
      List<DataCell> dataCells = [];
      for (int i = 0; i < TableDataHelper.kTableColumnsList.length; i++) {
        String title = '';
        switch (j) {
          case 0:
            title = TableDataHelper.kTableColumnsList[i].title1.toString();
            break;
          case 1:
            title = TableDataHelper.kTableColumnsList[i].title2.toString();
            break;
          case 2:
            title = TableDataHelper.kTableColumnsList[i].title3.toString();
            break;
          case 3:
            title = TableDataHelper.kTableColumnsList[i].title4.toString();
            break;
          case 4:
            title = TableDataHelper.kTableColumnsList[i].title5.toString();
            break;
          case 5:
            title = TableDataHelper.kTableColumnsList[i].title6.toString();
            break;
          case 6:
            title = TableDataHelper.kTableColumnsList[i].title7.toString();
            break;
          case 7:
            title = TableDataHelper.kTableColumnsList[i].title8.toString();
            break;
          case 8:
            title = TableDataHelper.kTableColumnsList[i].title9.toString();
            break;
          case 9:
            title = TableDataHelper.kTableColumnsList[i].title10.toString();
            break;
          case 10:
            title = TableDataHelper.kTableColumnsList[i].title11.toString();
            break;
          case 11:
            title = TableDataHelper.kTableColumnsList[i].title12.toString();
            break;
        }
        dataCells.add(DataCell(Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
          child: Text('   ' +
            title.toString(),
            style: TextStyle(color: Colors.black),
          ),
        )));
      }
      dataRows.add(DataRow(cells: dataCells));
    }

    return dataRows;
  }
}
