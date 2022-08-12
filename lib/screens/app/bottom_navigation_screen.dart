import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_elancer2/models/bn_screen.dart';
import 'package:on_boarding_elancer2/screens/app/settings_screen.dart';
import 'package:on_boarding_elancer2/screens/app/categories_screen.dart';
import 'package:on_boarding_elancer2/screens/app/home_screen.dart';
import 'package:on_boarding_elancer2/screens/app/users_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: HomeScreen()),
    const BnScreen(title: 'Users', widget: UsersScreen()),
    const BnScreen(title: 'Categories', widget: CategoriesScreen()),
    const BnScreen(title: 'Settings', widget: SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedPageIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 200,
              color: Colors.blue,
              child: const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text('Flutter'),
                accountEmail: Text('email.app.com'),
                otherAccountsPictures: [
                  CircleAvatar(),
                  CircleAvatar(),
                  CircleAvatar(),
                ],
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const CircleAvatar(
              //       radius: 50,
              //     ),
              //     const SizedBox(height: 5,),
              //     Text(
              //       ' User name',
              //       style: GoogleFonts.montserrat(
              //         color: Colors.white,
              //         fontSize: 18,
              //       ),
              //     ),
              //     const SizedBox(height: 5,),
              //     Text (
              //       'email.app.com',
              //       style: GoogleFonts.montserrat(
              //         color: Colors.white54,
              //         fontSize: 15,
              //       ),
              //     ),
              //
              //   ],
              // ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/thired_tab_screen');
                });
              },
              leading: const Icon(Icons.favorite),
              title: const Text('favorite'),
              subtitle: const Text('Favorite screen'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      body: _screens[_selectedPageIndex].widget,
      bottomNavigationBar: bottomNavBar(),
    );
  }

  // ClipRRect
  bottomNavBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //بحالة الشيفتينج لاوم ياخد لون كل وحدة على حدا
        // type: BottomNavigationBarType.shifting,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        //********************************//
        elevation: 4,
        //*********************************//
        // fixedColor: Colors.black38,
        selectedItemColor: Colors.blueGrey,
        selectedIconTheme: const IconThemeData(color: Colors.black38),
        selectedLabelStyle: GoogleFonts.montserrat(color: Colors.black38),
        selectedFontSize: 14,
        //********************************//
        onTap: (selectedPageIndex) {
          setState(() => _selectedPageIndex = selectedPageIndex);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: 'Person'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.category),
              icon: Icon(
                Icons.category_outlined,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(
                Icons.settings_applications_outlined,
              ),
              label: 'Settings'),
        ],
      );
}
