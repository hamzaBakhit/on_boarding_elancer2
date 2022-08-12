import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    required this.isCurrentPage,
  }) : super(key: key);

  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 4,
      width: 18,
      decoration: BoxDecoration(
        color: isCurrentPage == true? const Color(0xff6a90f2) : Colors.grey,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
