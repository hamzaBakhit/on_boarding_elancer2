import 'package:flutter/material.dart';
import 'package:on_boarding_elancer2/widgets/on_boarding_content.dart';
import 'package:on_boarding_elancer2/widgets/page_view_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: const Text('START'),
                ),
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  child: const Text('SKIP'),
                ),
              ),
            ),
            //page view
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                // physics: ClampingScrollPhysics(),
                // physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  OnBoardingContent(
                    image: 'onBoarding1',
                    title: 'Welcome!',
                  ),
                  OnBoardingContent(
                    image: 'onBoarding2',
                    title: 'add to card!',
                  ),
                  OnBoardingContent(
                    image: 'onBoarding3',
                    title: 'Engoy purchace!',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewIndicator(
                  isCurrentPage: _currentPage == 0,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 1,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 2,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInCirc);
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInCirc);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            Visibility(
              visible: _currentPage == 2,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3),
                          blurRadius: 6),
                    ],
                    gradient: const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.blue,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    child: Text(
                      'START',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0.0,
                      minimumSize: const Size(double.infinity, 50),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10)
                      // )
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
