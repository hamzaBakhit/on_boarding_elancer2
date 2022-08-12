import 'package:flutter/material.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: ((context, index) => const ListTile(
        leading: Icon(Icons.person),
        title: Text('title'),
      )),
    );
  }
}
