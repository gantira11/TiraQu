import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiraqu/constant.dart';
import 'package:tiraqu/screens/pages/berita_page.dart';
import 'package:tiraqu/screens/pages/info_page.dart';
import 'package:tiraqu/screens/pages/leanding_page.dart';
import 'package:tiraqu/screens/pages/setting_page.dart';
import 'package:tiraqu/screens/pages/user_home_page.dart';

class LeandingScreen extends StatefulWidget {
  const LeandingScreen({Key? key}) : super(key: key);

  @override
  State<LeandingScreen> createState() => _LeandingScreenState();
}

class _LeandingScreenState extends State<LeandingScreen> {
  int _selectedIndex = 0;
  bool isAuth = false;

  // Page !isAuth
  static const List<Widget> _widgetOptions = <Widget>[
    LeandingPage(),
    BeritaPage(),
    InfoPage()
  ];

  // Page isAuth
  static const List<Widget> _widgetOptionsAuth = <Widget>[
    UserHomePage(),
    BeritaPage(),
    InfoPage(),
    SettingPage(),
  ];

  static const List<BottomNavigationBarItem> _itemBotNav =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Berita',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      label: 'Info',
    ),
  ];

  static const List<BottomNavigationBarItem> _itemBotNavAuth =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Berita',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      label: 'Info',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _checkIfLoggedIn() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isAuth
          ? _widgetOptionsAuth.elementAt(_selectedIndex)
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
        items: isAuth ? _itemBotNavAuth : _itemBotNav,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: kLightPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
