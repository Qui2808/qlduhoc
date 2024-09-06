import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Công Ty Du Học Canada'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Chào mừng đến với Công Ty Du Học Canada',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Công ty du học Canada là một trong những công ty hàng đầu trong lĩnh vực tư vấn du học Canada. Chúng tôi cung cấp dịch vụ tư vấn du học chất lượng và đáng tin cậy, giúp bạn thực hiện ước mơ du học tại Canada.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
