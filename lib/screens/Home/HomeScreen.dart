import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/Home/favorite/HomeFavorite.dart';
import 'package:project_prak_tpm/screens/Home/tab/HomeTab.dart';
import 'package:project_prak_tpm/screens/Profile/ProfileScreen.dart';
import 'package:project_prak_tpm/screens/Tracker/TrackerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomeTab(),
        const HomeFavorite(),
        const TrackerScreen(),
        const ProfileScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/valorant_logo_2.png'), size: 30,), label: 'Match History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}
