import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/first_tab_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/second_tab_screen.dart';
import 'package:on_boarding_elancer2/screens/app/users_screen.dart';

class SecondFavoriteScreen extends StatefulWidget {
  const SecondFavoriteScreen({Key? key}) : super(key: key);

  @override
  _SecondFavoriteScreenState createState() => _SecondFavoriteScreenState();
}

class _SecondFavoriteScreenState extends State<SecondFavoriteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favorite'),
        bottom: TabBar(
          //*******************//
          isScrollable: false,
          /*********/
          indicatorColor: Colors.orange,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.tab,
          // indicatorPadding: EdgeInsets.zero,
          // indicator: const BoxDecoration(
          //   color: Colors.orange,
          //   // borderRadius: BorderRadius.only(
          //   //   topRight: Radius.circular(10),
          //   //   topLeft: Radius.circular(10),
          //   // )
          // ),
          //*********************************//
          // labelColor: Colors.black,
          // unselectedLabelColor: Colors.grey,
          // labelStyle: GoogleFonts.montserrat(
          //   fontWeight: FontWeight.bold
          // ),
          // unselectedLabelStyle: GoogleFonts.montserrat(
          //   fontWeight: FontWeight.w300,
          //   // color: Colors.blue
          // ),
          //*************//
          onTap: (int selectedTabIndex) {
            print(selectedTabIndex);
          },
          controller: _tabController,
          tabs: const  [
            Tab(
              text: 'First',
            ),
            Tab(
              text: 'Second',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FirstTabScreen(),
          SecondTabScreen(),
        ],
      ),
    );
  }
}
