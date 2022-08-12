import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/first_tab_screen.dart';
import 'package:on_boarding_elancer2/screens/app/drawer/tabs/second_tab_screen.dart';

class ThiredFavoriteScreen extends StatefulWidget {
  const ThiredFavoriteScreen({Key? key}) : super(key: key);

  @override
  _ThiredFavoriteScreenState createState() => _ThiredFavoriteScreenState();
}

class _ThiredFavoriteScreenState extends State<ThiredFavoriteScreen>
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
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'subtitle here',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                indicator: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black45,
                        blurRadius: 5),
                  ],
                ),
                controller: _tabController,
                onTap: (value) {
                  setState(() {
                    _tabController.index = value;
                  });
                },
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
            ],
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              Visibility(
                visible: _tabController.index == 0,
                child: FirstTabScreen(),
              ),
              Visibility(
                visible: _tabController.index == 1,
                child: SecondTabScreen(),
              ),
            ],
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height - 187 - 80 -20,
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: const [
          //       FirstTabScreen(),
          //       SecondTabScreen(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
