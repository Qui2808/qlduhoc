import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolPartner extends StatelessWidget {
  const SchoolPartner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/partner/partner1.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/partner/partner2.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      'Learn online from the leaders in business education',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Text(
              'Expand your business skills and engage with a global network'
              ' of learners through our flexible, online courses. Wherever'
              ' you are in your career—or the world—Harvard Business School'
              ' Online can help you achieve your goals.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.getFont(
                'Montserrat',
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Color(0xFFA41034),
            child: Center(
              child: Text(
                'Explore All Courses',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset(
              'assets/partner/partner3.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            'Need More Information?',
            textAlign: TextAlign.center,
            style: GoogleFonts.getFont(
              'Montserrat',
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: Text(
              "If you're thinking about how to prepare for the next"
              " stage in your career, we can help. Request more "
              "information today.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.getFont(
                'Montserrat',
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.03,
            ),
            decoration: BoxDecoration(
                color: Color(0xFFA41034),
                borderRadius: BorderRadius.circular(8.0)),
            child: TextButton(
              //Tắt hiệu ứng splash khi click button
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                'Request more info',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                print("liên hệ");
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Color(0xFFA41034),
            child: Center(
              child: Text(
                'H A R V A R D | B U S S I N E S S | S C H O O L',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
