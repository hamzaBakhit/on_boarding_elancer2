import 'package:flutter/material.dart';

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return const Card(elevation: 5,);
        });
  }
}
