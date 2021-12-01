import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:timeline_tile/timeline_tile.dart' as timelineTile;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Ngash Portfolio',
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
        baseColor: Color(0xffC4E9DB),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF121312),
        lightSource: LightSource.topLeft,
        shadowDarkColor: NeumorphicColors.decorationMaxDarkColor,
        depth: 9,
      ),
      home: MyHomePage(),
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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: const Color(0xff0B0F0C),
      extendBody: true,
      body: CustomScrollView(shrinkWrap: true, slivers: <Widget>[
        SliverAppBar(
          titleSpacing: 15,
          centerTitle: true,
          leading: Container(
            width: 100,
            color: Colors.transparent,
          ),
          title: NeumorphicText(
            "DANCHE   NG'ANG'A",
            style: const NeumorphicStyle(
              intensity: 8,
              depth: 1.2,
              color: Colors.white12,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 28,
            ),
          ),
          backgroundColor: Colors.transparent.withOpacity(0.1),
          // expandedHeight: 200,
          // make the app bar reappear when scrolling up
          floating: true,
          //  pinned: true,
          actions: [
            Container(
              width: screenWidth * .15,
              color: Colors.transparent.withOpacity(0.15),
            ),
          ],
        ),
        SliverPersistentHeader(
          delegate: PersistentHeaderDelegate(),
          // pinned: true,
          // floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              NeumorphicButton(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {
                  print("onClick");
                },
                style: NeumorphicStyle(
                  lightSource: LightSource.bottom,
                  intensity: 0.5,
                  depth: 3,
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(
                      const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: screenHeight * 0.42,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 140,
                      //   child: const Text(
                      //     'I',
                      //     style: TextStyle(fontSize: 108),
                      //   ),
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 28,
                              color: const Color(0xff39EBD8),
                              fontWeight: FontWeight.w700,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText(
                                  'Hello World !!',
                                ),
                                WavyAnimatedText(
                                  "I'm Danche Ng'ang'a",
                                ),
                              ],
                              isRepeatingAnimation: false,
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  'Discipline is the best tool '),
                            ],
                            onTap: () {
                              print("Tap Event ");
                            },
                          ),
                          const Text('I craft Awesome tech products'),
                          const Text('Get CREATIVE with FLUTTER'),
                          const Text('Build Apps with FLUTTER'),
                          const Text('Feed my CURIOSITY with Physics'),
                        ],
                      ),
                      Container(
                        height: screenHeight * .4,
                        width: 45,
                        child: timelineTile.TimelineTile(
                          indicatorStyle: timelineTile.IndicatorStyle(
                            width: 30,
                            color: Colors.transparent,
                            indicatorXY: 0.55,
                            padding: EdgeInsets.only(
                              top: 3,
                              bottom: 2
                            ),
                            iconStyle: timelineTile.IconStyle(
                              color: Colors.tealAccent,
                              iconData: Icons.thumb_up,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 390,
                width: 100,
              ),
              NeumorphicText(
                "I love flutter",
                style: const NeumorphicStyle(
                  depth: 7, //customize depth here
                  color: Colors.black, //customize color here
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 28, //customize size here
                  // AND others usual text style properties (fontFamily, fontWeight, ...)
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class Neumorphic {}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.3),
        image: const DecorationImage(
          opacity: 0.4,
          filterQuality: FilterQuality.medium,
          fit: BoxFit.none,
          image: AssetImage('assets/images/galaxy.jpg'),
        ),
        borderRadius:
            const BorderRadius.only(bottomRight: Radius.elliptical(10, 20)),
      ),
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
