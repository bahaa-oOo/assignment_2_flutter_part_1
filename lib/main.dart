import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF3b5998), // اللون الأزرق الخاص بفيسبوك
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.white,
              size: 80.0,
            ),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email or Phone',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
              obscureText: true,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // التنقل إلى شاشة Home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4c66a4), // لون الزر
                padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
              ),
              child: Text(
                'LOG IN',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // حدث الاشتراك
              },
              child: Text(
                'Sign Up for Facebook',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                // حدث نسيان كلمة المرور
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الشاشة الرئيسية Home
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF3b5998),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // فعل أي شيء عند الضغط
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم القصص (Stories)
            Container(
              height: 120,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem(),
                  _buildStoryItem(),
                  _buildStoryItem(),
                  _buildStoryItem(),
                  _buildStoryItem(),
                ],
              ),
            ),
            Divider(height: 1.0, color: Colors.grey),
            // قسم المنشورات (Posts)
            _buildPostItem(),
            _buildPostItem(),
          ],
        ),
      ),
    );
  }

  // ويدجت لعرض القصص (Story)
  // ويدجت لعرض القصص (Story)
  Widget _buildStoryItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        alignment: Alignment.topLeft, // محاذاة الأيقونة في الزاوية العلوية اليسرى
        children: [
          Container(
            width: 100.0, // العرض المستطيلي للصورة
            height: 160.0, // الارتفاع المستطيلي للصورة
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // جعل الحواف دائرية
              image: DecorationImage(
                image: AssetImage('assets/facebookStory.jpg'), // صورة القصة
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 5.0,
            left: 5.0,
            child: Icon(
              Icons.account_circle, // الأيقونة في الزاوية العلوية اليسرى
              color: Colors.white,
              size: 20.0,
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Text(
              'OWNER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ويدجت لعرض المنشور (Post)
  Widget _buildPostItem() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/avatar.png'), // صورة البروفايل
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Owner', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('3h', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.public, size: 12.0, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text('My post'),
          SizedBox(height: 10.0),
          Row(
            children: [
              Text('100', style: TextStyle(color: Colors.grey)),
              Image.asset(
                'assets/like.jpg', // المسار إلى الصورة الخاصة بـ Like
                width: 16.0, // عرض الصورة
                height: 16.0, // ارتفاع الصورة
              ),
              Spacer(),
              Text('100 Comments', style: TextStyle(color: Colors.grey)),
            ],
          ),

          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPostButtonWithImage('assets/singleLike.jpg', 'Like'),
              _buildPostButtonWithImage('assets/comment.jpg', 'Comment'),
              _buildPostButtonWithImage('assets/share.png', 'Share'),
            ],
          ),

        ],
      ),
    );
  }

  // زر أسفل المنشور
  // ويدجت لزر يحتوي على صورة
  Widget _buildPostButtonWithImage(String imagePath, String label) {
    return TextButton.icon(
      onPressed: () {
        // حدث عند الضغط
      },
      icon: Image.asset(
        imagePath,
        width: 20.0, // عرض الصورة
        height: 20.0, // ارتفاع الصورة
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

}
