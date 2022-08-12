import 'package:flutter/material.dart';
import 'package:on_boarding_elancer2/widgets/home_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 190),
          child: PageView.builder(
            itemCount: 3,
            controller: _pageController,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int value) {},
            itemBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
              width: 100,
              color: index % 2 == 0 ? Colors.black38 : Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'coconst ntainer $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),

        HomeSection(title: 'Most recent', onPressed: () {}),
        // ConstrainedBox(
        //   constraints: const BoxConstraints(minHeight: 100,maxHeight: 100),
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         margin: const EdgeInsets.symmetric(horizontal: 5),
        //         width: 100,
        //         height: 100,
        //         color: Colors.black54,
        //       );
        //     },
        //   ),
        // ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 130,
          ),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                // mainAxisExtent: 90,
                childAspectRatio: 130 / 90),
            itemBuilder: (context, index) => Container(
              color: Colors.black38,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        HomeSection(title: 'Favorite product', onPressed: () {}),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        HomeSection(title: 'Offers', onPressed: () {}),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Colors.grey,
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          itemCount: 10,
        ),
      ],
    );
  }
}
