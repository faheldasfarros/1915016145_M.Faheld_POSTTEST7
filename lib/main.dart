import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/FormPage.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/detailPage.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/mainPage.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/splashScreen.dart';
import 'package:postest6_1915016145_m_faheld_as_farros/messagePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '1915016145',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class landingPage extends StatelessWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Text(
                'WELCOME',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Text(
                'TO STEAM CHAT',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 52, 183, 231),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 80),
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/steam.png'),
                  ),
                ),
              ),
              SizedBox(height: 120),
              Text(
                'CHAT WITH FRIENDS AND GROUPS',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 52, 183, 231),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Check in with friends,coordinate a time to\nplay with your group, or check out official\ngame chats.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return bottomBar();
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 52, 183, 231),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xFF1A374D),
    );
  }
}

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  final List<BottomNavigationBarItem> _myIcons = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: '',
    ),
  ];

  final List<Widget> _myViews = [
    MainPage(),
    FormPage(),
    messagePage(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myViews.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _myIcons,
        onTap: (int newIndex) {
          setState(
            () {
              _pageIndex = newIndex;
            },
          );
        },
      ),
    );
  }
}
