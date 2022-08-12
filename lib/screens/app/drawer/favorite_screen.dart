import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/first_tab_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/second_tab_screen.dart';
import 'package:on_boarding_elancer2/screens/app/users_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
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
        // bottom: ,
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 40,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'subtitle here',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'First',
              ),
              Tab(
                text: 'Second',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                FirstTabScreen(),
                SecondTabScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
