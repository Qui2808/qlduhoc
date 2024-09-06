import 'package:flutter/material.dart';
import 'package:qlduhoc/homepage/home/HomePage.dart';
import 'package:qlduhoc/homepage/school/SchoolPage.dart';
import 'package:qlduhoc/homepage/info/SettingPage.dart';
import 'package:qlduhoc/database.dart';
import 'package:qlduhoc/homepage/search/SearchPage.dart';
import 'package:qlduhoc/model/News.dart';

import 'package:qlduhoc/model/User.dart';
import 'package:qlduhoc/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/School.dart';
import '../model/data.dart';
import 'home/HomePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<Widget> _widgetOptions = <Widget>[HomePage(), SchoolPage(), SettingPage()];

class _MainPageState extends State<MainPage> {
  //share preferences
  late SharedPreferences themeMode;

  int _selectedIndex = 0;

  bool _thememode = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  List<School> _schoolData = [];

  Future<void> getSchool() async {
    _schoolData = await ReadData().ListSchool();
    if(!mounted)
      return;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _ShowData();
    initial();
    getSchool();
  }

  void initial() async {
    themeMode = await SharedPreferences.getInstance();
    setState(() {
      _thememode = themeMode.getBool('theme') ?? false;
    });
  }

  // test - Khải - 7/10/2023
  bool _showAppBar = true; // mặc định hiển thị appBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        // settingpage được chọn
        _showAppBar = false; // ẩn appBar
      } else {
        _showAppBar = true; // hiển thị appBar cho các trang còn lại
      }
    });
  }

  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _thememode ? darkMode : lightMode,
      home: Scaffold(
        body: Column(
          children: [
            if (_showAppBar)
              AppBar(
                title: GestureDetector(
                  child: Image.asset(
                    'assets/logo.png',
                    // fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
                backgroundColor: Color.fromRGBO(125, 31, 31, 1),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchPage(
                            schoolData: _schoolData,
                          );
                        }));
                      },
                      icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () async {
                        setState(() {
                          _thememode = !_thememode;
                        });
                        themeMode.setBool("theme", _thememode);
                      },
                      icon: Icon(_thememode ? _iconDark : _iconLight)),
                ],
              ),
            Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), label: 'Trường học'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Thông tin',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:
              _thememode ? Colors.white : Color.fromRGBO(125, 31, 31, 1),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
