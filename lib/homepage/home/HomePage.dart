import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlduhoc/homepage/home/MainListHorizontal.dart';
import 'package:qlduhoc/homepage/home/detail/DetailNews.dart';
import 'package:qlduhoc/model/data.dart';

import '../../database.dart';
import '../../model/News.dart';
import '../../model/User.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../mainpage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Slideshow
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  //Get News
  List<News> newsData = [];
  List<News> eventsData = [];


  Future<void> getNews() async {
    final response = await http.get(Uri.parse(
        'https://admin-duhocsinhcanada.vercel.app/api/news?fbclid=IwAR0sy2DhD1EPqAxRBSDYVyN15XLCt9ujwFnaULgJH-TgRjSvpSXqGeBYAZk'));
    newsData =  News.parseList(response);

    //newsData= await ReadData().ListNews();
    eventsData = newsData.reversed.toList();

    if(!mounted)
      return;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    // Bắt đầu slideshow sau 3 giây và chuyển trang sau mỗi 3 giây.
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < _sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    //Get News
    getNews();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  final List<String> _sliderImages = [
    'assets/banner/HomeSilder.jpg',
    'assets/banner/HomeSlider2.jpg',
    'assets/banner/HomeSlider3.jpg',
    'assets/banner/HomeSlider4.jpg',
  ];

  final List _newsTitle = [
    '8 đại học Canada hấp dẫn sinh viên quốc tế nhất',
    'Săn học bổng từ hơn 30 trường',
    'Các nước phát triển mở rộng chính sách thu hút du học sinh',
    '5 Thành phố tốt để du học Canada',
  ];

  final List _newsImage = [
    'assets/news/newsduhoc1.png',
    'assets/news/newsduhoc2.png',
    'assets/news/newsduhoc3.png',
    'assets/news/newsduhoc4.png',
  ];

  final List _eventsTitle = [
    'Vancouver Celebration of Light, Vancouver',
    'The Calgary Stampede, Calgary',
    'Edmonton Folk Festival, Edmonton',
    'Toronto International Film Festival, Toronto',
  ];
  final List _eventsImage = [
    'assets/events/sukien1.jpg',
    'assets/events/sukien2.jpg',
    'assets/events/sukien3.jpg',
    'assets/events/sukien4.jpg',
  ];

  //

  @override
  Widget build(BuildContext context) {
    final List<Image> _slider = _sliderImages
        .map((image) => Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ))
        .toList();

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //Thêm dòng này
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * (1 / 4),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: _slider,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentPage,
                    count: _slider.length,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      dotColor: Color.fromRGBO(217, 217, 217, 1),
                      activeDotColor: Color.fromRGBO(102, 102, 102, 1),
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Tin tức mới nhất',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailNews(newsData: newsData)));
                          },
                          child: Text(
                            'Xem tất cả',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  child: Scaffold(
                    body: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newsData.length,
                        itemBuilder: (context, index) {
                          return MainListHorizontal(newsData: newsData[index]);
                        }),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Sự kiện mới nhất',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailNews(newsData: eventsData)));
                          },
                          child: Text(
                            'Xem tất cả',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  child: Scaffold(
                    body: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: eventsData.length,
                        itemBuilder: (context, index) {
                          return MainListHorizontal(
                              newsData: eventsData[index]);
                        }),
                  ),
                ),

                // Container(
                //   width: double.infinity,
                //   height: 50,
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Text(
                //         'Sự kiện',
                //         style: GoogleFonts.getFont(
                //           'Montserrat',
                //           fontSize: 16,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Expanded(
                //         child: InkWell(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => DetailEvents(
                //                         title: _eventsTitle,
                //                         image: _eventsImage)));
                //           },
                //           child: Text(
                //             'Xem tất cả',
                //             textAlign: TextAlign.end,
                //             style: GoogleFonts.getFont(
                //               'Montserrat',
                //               fontSize: 12,
                //               fontWeight: FontWeight.w600,
                //               fontStyle: FontStyle.italic,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 1 / 4,
                //   child: Scaffold(
                //     body: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: _eventsImage.length,
                //         itemBuilder: (context, index) {
                //           return MainListHorizontal(
                //               schoolChildTitle: _eventsTitle[index],
                //               schoolChildImage: _eventsImage[index]);
                //         }),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
