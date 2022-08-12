import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => const ListTile(
              leading: Icon(Icons.person),
              title: Text('Title'),
              subtitle: Text('subTitle'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
        separatorBuilder: (context, index) => const Divider(
              height: 2,
              color: Colors.black,
            ),
        itemCount: 20);

    // body: ListView.builder(
    //   itemCount: 5,
    //   padding: EdgeInsets.symmetric(horizontal: 20),
    //   physics: BouncingScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //   itemBuilder: (context, index) => const ListTile(
    //     leading: Icon(Icons.person),
    //     title: Text('Title'),
    //     subtitle: Text('subTitle'),
    //     trailing: Icon(
    //       Icons.arrow_forward_ios,
    //       size: 18,
    //     ),
    //   ),
    // ),
    // body: ListView(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   scrollDirection: Axis.vertical,
    //   physics: BouncingScrollPhysics(),
    //   children: const [
    //     ListTile(
    //       leading: Icon(Icons.person),
    //       title: Text('Title'),
    //       subtitle: Text('subTitle'),
    //       trailing: Icon(Icons.arrow_forward_ios,size: 18,),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.person),
    //       title: Text('Title'),
    //       subtitle: Text('subTitle'),
    //       trailing: Icon(Icons.arrow_forward_ios,size: 18,),
    //     ),
    //     ListTile(
    //       leading: Icon(Icons.person),
    //       title: Text('Title'),
    //       subtitle: Text('subTitle'),
    //       trailing: Icon(Icons.arrow_forward_ios,size: 18,),
    //     ),
    //   ],
    // ),
  }
}
