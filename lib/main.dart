import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:genialngash/projectsTile.dart';
import 'package:genialngash/widgets.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Color baseColor = Color(0xff254341);
  double firstDepth = 10;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;
  late AnimationController _animationController;
  static const colorizeColors = [
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.red,
    Colors.white
  ];
  IconData mapPinIcon = CupertinoIcons.map_pin;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 8),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? stagger(value, progress, delay) {
      progress = progress - (1 - delay);
      if (progress < 0) progress = 0;
      return value * (progress / delay);
    }

    double calculatedFirstDepth =
        stagger(firstDepth, _animationController.value, 0.25)!;
    double calculatedSecondDepth =
        stagger(secondDepth, _animationController.value, 0.5)!;
    double calculatedThirdDepth =
        stagger(thirdDepth, _animationController.value, 0.75)!;
    double calculatedFourthDepth =
        stagger(fourthDepth, _animationController.value, 1)!;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: const Color(0xff0B0F0C),
      extendBody: true,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
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
                    height: screenHeight * 0.46,
                    width: screenWidth*0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                color: const Color(0xff18F2DA),
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
                            const Text('I craft AWESOME tech products'),
                            const Text('Get CREATIVE with FLUTTER'),
                            const Text('Build Apps with FLUTTER'),
                            const Text('Feed my CURIOSITY with Physics'),
                          ],
                        ),

                        Container(
                          height: screenHeight * .45,
                          width: 100,
                          child: timelineTile.TimelineTile(
                            indicatorStyle: timelineTile.IndicatorStyle(
                              height: screenHeight * .15,
                              width: screenHeight * .15,
                              color: Colors.transparent,
                              drawGap: true,
                              indicatorXY: 0.52,
                              padding: EdgeInsets.only(top: 3, bottom: 2),
                              indicator: Center(
                                child: ClayContainer(
                                  color: Color(0xffF13D3D),
                                  height: screenHeight * .4,
                                  width: screenHeight * .4,
                                  borderRadius: 150,
                                  curveType: CurveType.concave,
                                  spread: 150,
                                  depth: calculatedFirstDepth.toInt(),
                                  child: Center(
                                    child: ClayContainer(
                                      height: screenHeight * .25,
                                      width: screenHeight * .25,
                                      borderRadius: 50,
                                      spread: 100,
                                      depth: calculatedSecondDepth.toInt(),
                                      curveType: CurveType.convex,
                                      color: Color(0xff05261C),
                                      child: Center(
                                        child: ClayContainer(
                                          height: screenHeight * .2,
                                          width: screenHeight * .2,
                                          borderRadius: 150,
                                          spread: 3,
                                          color: Color(0xff0A5743),
                                          depth: calculatedThirdDepth.toInt(),
                                          curveType: CurveType.concave,
                                          child: Center(
                                            child: ClayContainer(
                                              height: screenHeight * .08,
                                              width: screenHeight * .08,
                                              spread: 3.5,
                                              borderRadius: 150,
                                              color: Color(0xff043D2E),
                                              depth:
                                                  calculatedFourthDepth.toInt(),
                                              curveType: CurveType.convex,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              //TODO repeatForever: true,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'SKILLS. ',
                                  speed: Duration(milliseconds: 357),
                                  textStyle: TextStyle(
                                    fontSize: 30,
                                  ),
                                  colors: colorizeColors,
                                ),
                              ],
                              isRepeatingAnimation: true,
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                            skillWidget(
                                skill: 'Flutter/dart(mobile and desktop Apps)',
                                icondata: CupertinoIcons.pin_fill),
                            skillWidget(
                                skill: 'Version Control - Git, Github',
                                icondata: mapPinIcon),
                            skillWidget(
                                skill: 'Cloud computing - Aws,Firebase',
                                icondata: mapPinIcon),
                            skillWidget(
                                skill: 'Python,C,C++', icondata: mapPinIcon),
                            skillWidget(
                                skill: 'Linux ecosystem', icondata: mapPinIcon),
                            skillWidget(
                                skill:
                                    'Computer networking - Routing & switching,Network security',
                                icondata: mapPinIcon),
                            skillWidget(
                                skill:
                                    'Applied Physics - Electronics,Renewable energy,Communication Eng',
                                icondata: CupertinoIcons.waveform)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ProjectsTile(screenWidth: screenWidth),
                ProjectsTile(screenWidth: screenWidth),
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
                Container(
                  color: baseColor,
                  child: Center(
                    child: ClayContainer(
                      color: baseColor,
                      height: 240,
                      width: 240,
                      borderRadius: 200,
                      curveType: CurveType.concave,
                      spread: 30,
                      depth: calculatedFirstDepth.toInt(),
                      child: Center(
                        child: ClayContainer(
                          height: 200,
                          width: 200,
                          borderRadius: 200,
                          depth: calculatedSecondDepth.toInt(),
                          curveType: CurveType.convex,
                          color: baseColor,
                          child: Center(
                            child: ClayContainer(
                                height: 160,
                                width: 160,
                                borderRadius: 200,
                                color: baseColor,
                                depth: calculatedThirdDepth.toInt(),
                                curveType: CurveType.concave,
                                child: Center(
                                    child: ClayContainer(
                                  height: 120,
                                  width: 120,
                                  borderRadius: 200,
                                  color: baseColor,
                                  depth: calculatedFourthDepth.toInt(),
                                  curveType: CurveType.convex,
                                ))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
//  Container(
//   // clipBehavior: Clip.antiAlias,
//   decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: LinearGradient(colors: [
//         Colors.white10,
//         Colors.white30,
//         Colors.black54,
//       ]),
//       boxShadow: [
//         BoxShadow(
//           blurRadius: 1,
//           spreadRadius: 2,
//           color: Colors.white,
//         ),
//         BoxShadow(
//           blurRadius: 1,
//           spreadRadius: 2,
//           color: Colors.black87,
//         )
//       ]),
//   child: Icon(
//     Icons.thumb_up,
//     color: Colors.teal,
//   ),
// ),
// iconStyle: timelineTile.IconStyle(
//   color: Colors.tealAccent,
//   iconData: Icons.thumb_up,
// ),
