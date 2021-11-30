import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ngash Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff0B0F0C),
      extendBody: true,
      body: CustomScrollView(shrinkWrap: true, slivers: <Widget>[
        SliverAppBar(
          title: const Text("Danche Ng'ang'a"),
          backgroundColor: Colors.cyan,
          // expandedHeight: 200,
          // make the app bar reappear when scrolling up
          floating: true,
          //  pinned: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                size: 30,
                semanticLabel: 'Search',
              ),
            ),
          ],
        ),
        SliverPersistentHeader(
          delegate: PersistentHeaderDelegate(),
         // pinned: true,
          // floating: true,
        ),
        SliverList(delegate: SliverChildListDelegate([
Container(height: 20,width: 40,color: Colors.red),
Container(height: 20,width: 40,color: Colors.white),
Container(height: 20,width: 40,color: Colors.blue)

        ])),
      ]),
    );
  }
}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 40,
      color: Colors.purple,
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
