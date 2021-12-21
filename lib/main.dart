import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:genialngash/projectsTile.dart';
import 'package:genialngash/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:timeline_tile/timeline_tile.dart' as timelineTile;

//TODO internet buddies widget
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Ngash Portfolio',
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
        baseColor: Color(0xffC4E9DB),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor:
            //baseColor,
            Color(0xFF121312),
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
  Color baseColor = const Color(0xff00100F);

  //Color baseColor = Color(0xff001413);
  double firstDepth = 10;
  double secondDepth = 50;
  double thirdDepth = 50;
  double fourthDepth = 50;

  late AnimationController _animationController;
  Stream<Duration> _streamDays() {
    Duration interval = Duration(seconds: 1);
    Stream<Duration> stream =
        Stream<Duration>.periodic(interval, calculateDays).asBroadcastStream();

    return stream;
  }

  Duration calculateDays(int value) {
    return DateTime.now().difference(DateTime(2019, 12, 14, 0, 0));
  }

  IconData mapPinIcon = CupertinoIcons.map_pin;
  TextStyle bioTextStyle = GoogleFonts.ibmPlexMono(color: Colors.white);
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 8),
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
                Container(
                  //tooltip: 'Bio Data',
                  margin: const EdgeInsets.symmetric(horizontal: 17),
                  // onPressed: () {
                  //   print("onClick");
                  // },
                  // style: NeumorphicStyle(
                  //   lightSource: LightSource.bottom,
                  //   intensity: 0.5,
                  //   depth: 3,
                  //   shape: NeumorphicShape.concave,
                  //   boxShape: NeumorphicBoxShape.roundRect(
                  //       const BorderRadius.only(
                  //           bottomRight: Radius.circular(20),
                  //           topLeft: Radius.circular(20))),
                  // ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                  child: ClayContainer(
                    spread: 4,
                    depth: 27,
                    curveType: CurveType.concave,
                    color: baseColor,
                    //   color: const Color(0xff2F5552),
                    customBorderRadius: BorderRadius.all(
                      Radius.elliptical(5, 43),
                    ),
                    child: Container(
                      height: screenHeight * 0.46,
                      width: screenWidth * 0.84,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: screenHeight * 0.46,
                            width: screenWidth * .29,
                            child: DefaultTextStyle(
                              style: bioTextStyle,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  DefaultTextStyle(
                                    style: GoogleFonts.secularOne(
                                        fontSize: 28,
                                        color: const Color(0xff2EF3A3),
                                        //color: Colors.greenAccent,
                                        fontWeight: FontWeight.w400,
                                        shadows: [
                                          Shadow(
                                              // color: Colors.tealAccent,
                                              offset: Offset(0.0, 3.0),
                                              blurRadius: 5.0),
                                        ]),
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
                                          'I craft AWESOME tech products '),
                                    ],
                                    onTap: () {
                                      print("Tap Event ");
                                    },
                                  ),
                                  const Text('Get CREATIVE with FLUTTER'),
                                  const Text('Build Apps with FLUTTER'),
                                  const Text('Feed my CURIOSITY with Physics'),
                                ],
                              ),
                            ),
                          ),
                          glowContainerTimeline(
                              screenHeight,
                              calculatedFirstDepth,
                              calculatedSecondDepth,
                              calculatedThirdDepth,
                              calculatedFourthDepth),
                          Container(
                            height: screenHeight * .46,
                            width: screenWidth * .40,
                            child: ListView(
                                clipBehavior: Clip.antiAlias,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textAnimateColorized(text: 'SKILLS. '),
                                      skillWidget(
                                          skill:
                                              'Flutter/dart(mobile and desktop Apps)',
                                          icondata: CupertinoIcons.pin_fill),
                                      skillWidget(
                                          skill:
                                              'Version Control - Git, Github',
                                          icondata: mapPinIcon),
                                      skillWidget(
                                          skill:
                                              'Cloud computing - Aws,Firebase',
                                          icondata: mapPinIcon),
                                      skillWidget(
                                          skill: 'Python,C,C++',
                                          icondata: mapPinIcon),
                                      skillWidget(
                                          skill:
                                              'Computer networking - Routing & switching,Network security',
                                          icondata: mapPinIcon),
                                      skillWidget(
                                          skill:
                                              'Linux ecosystem and security - Parrot O.S',
                                          icondata: mapPinIcon),
                                      skillWidget(
                                          skill:
                                              'Applied Physics - Electronics,Renewable energy,Communication Engineering',
                                          icondata: CupertinoIcons.waveform)
                                    ],
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 30),
                  height: 125,
                  child: timelineTile.TimelineTile(
                    lineXY: 0.42469,
                    alignment: timelineTile.TimelineAlign.manual,
                    indicatorStyle: timelineTile.IndicatorStyle(
                      width: screenWidth * .3,
                      height: 55,
                      drawGap: true,
                      indicator: Container(
                        alignment: Alignment.center,
                        width: screenWidth * .3,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.8),
                          border: Border.all(
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: textAnimateColorized(text: 'PROJECTS. '),
                      ),
                    ),
                  ),
                ),
                const ProjectsTile(
                  projectTitle: 'Telegram Links app',
                  index: '1',
                  assetImageName: 'telegram.jpg',
                  url:
                      'https://play.google.com/store/apps/details?id=com.telegramlinks',
                  projectDescription:
                      'The app contains catalogue for telegram Links - channels,groups and bots that are well arranged and categorized',
                ),
                const ProjectsTile(
                  projectTitle: 'Telegram Links Desktop(Linux) application',
                  assetImageName: 'telegram_dark.jpg',
                  index: '2',
                  url:
                      'https://github.com/Genialngash/Telegram-Links-desktop-installer-Linux-',
                  projectDescription:
                      'A desktop version of the telegram links android app.Supported on major linux distributions',
                ),
                const ProjectsTile(
                    projectTitle: 'Applied Physics (CURRENT project)',
                    index: '3',
                    url: 'https://github.com/Genialngash',
                    projectDescription:
                        '''A platform that aids Engineers, scientists,and researchers in collaboration, referencing and calculations''',
                    assetImageName: 'applied.png'),
                const ProjectsTile(
                  projectTitle: 'Ohm’s resistance',
                  assetImageName: 'ohms.png',
                  index: '4',
                  projectDescription:
                      'Enables the user to calculate resistor color coding in real time and OHM\'s law',
                  url:
                      'https://play.google.com/store/apps/details?id=com.ohmsresistance',
                ),
                const ProjectsTile(
                  projectTitle: 'Bonyeza',
                  assetImageName: 'bonyeza.jpg',
                  index: '5',
                  projectDescription:
                      'Enables one to dial USSD codes directly - reduces the hussle of craming the codes',
                  url:
                      'https://play.google.com/store/apps/details?id=com.ngash.bonyeza',
                ),
                Container(
                  padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                  child: ClayContainer(
                    spread: 4,
                    depth: 24,
                    height: screenHeight * .4,
                    width: screenWidth - 100,
                    color: baseColor,
                    curveType: CurveType.concave,
                    // color: const Color(0xff2F5552),
                    customBorderRadius: BorderRadius.all(
                      Radius.elliptical(3, 53),
                    ),
                    // alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ClayContainer(
                        //   color: Color(0xff011A1B),
                        //   //emboss: true,
                        //   spread: 0.8,
                        //   depth: 95,
                        //   curveType: CurveType.convex,
                        //   customBorderRadius: BorderRadius.all(
                        //     Radius.elliptical(3, 13),
                        //   ),
                        //child:

                        AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'I have been using flutter for:',
                              speed: Duration(milliseconds: 340),
                              textStyle: GoogleFonts.ibmPlexMono(
                                fontSize: 25,
                              ),
                              colors: [
                                Colors.white,
                                Colors.greenAccent,
                                Colors.tealAccent,
                                Colors.red,
                              ],
                            ),
                          ],
                        //  isRepeatingAnimation: true,
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                        // textAnimateColorized(
                        //     text: 'I have been using flutter for :',
                        //     fontsize: 30),
                        // child: Text(
                        //   'I have been using flutter for :',
                        //   s
                        //   // emboss: true,
                        //   // color: Color(0xffD1FBFB),
                        //   // depth: 15,
                        //   // spread: 0.5,
                        //   // size: 40,
                        // ),
                        // ),
                        StreamBuilder<Duration>(
                            stream: _streamDays(),
                            builder: (BuildContext context,
                                AsyncSnapshot<Duration> snapshot) {
                              var data = snapshot.data;
                              if (data == null) return Text('<Loading..>');
                              var seconds = data.inSeconds;
                              final days = seconds ~/ Duration.secondsPerDay;
                              seconds -= days * Duration.secondsPerDay;
                              final hours = seconds ~/ Duration.secondsPerHour;
                              seconds -= hours * Duration.secondsPerHour;
                              final minutes =
                                  seconds ~/ Duration.secondsPerMinute;
                              seconds -= minutes * Duration.secondsPerMinute;

                              final List<String> tokens = [];
                              if (days != 0) {
                                tokens.add('${days}');
                              }
                              if (tokens.isNotEmpty || hours != 0) {
                                tokens.add('${hours}');
                              }
                              if (tokens.isNotEmpty || minutes != 0) {
                                tokens.add('${minutes}');
                              }
                              tokens.add('${seconds}');

                              // tokens.join(':');
                              print(tokens);

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ExperienceDaysContainer(
                                    duration: tokens[0],
                                    durationName: 'Days',
                                  ),
                                  ExperienceDaysContainer(
                                    duration: tokens[1],
                                    durationName: 'Hours',
                                  ),
                                  ExperienceDaysContainer(
                                    duration: tokens[2],
                                    durationName: 'Minutes',
                                  ),
                                  ExperienceDaysContainer(
                                    duration: tokens[3],
                                    durationName: 'Seconds',
                                  ),
                                ],
                              );
                            }),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.elliptical(9, 3)),
                            border: Border.all(
                              width: 2,
                              color: Colors.amberAccent,
                            ),
                          ),
                          child: ClayContainer(
                            height: screenHeight * .2,
                            width: screenWidth - 200,
                            borderRadius: 30,
                            spread: 2,
                            color: baseColor,
                            depth: 9,
                            curveType: CurveType.convex,
                            child: Column(
                              children: [
                                Text(
                                  'Let\'s be Internet Buddies',
                                  style: GoogleFonts.ibmPlexMono(fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                ClayContainer(
                  height: screenHeight * .25,
                  width: screenWidth - 100,
                  borderRadius: 20,
                  color: baseColor,
                  spread: 2,
                  depth: calculatedThirdDepth.toInt(),
                  curveType: CurveType.concave,
                  child: Center(
                    child: ClayContainer(
                      height: screenHeight * .2,
                      width: screenWidth - 200,
                      borderRadius: 20,
                      spread: 2,
                      color: baseColor,
                      depth: calculatedFourthDepth.toInt(),
                      curveType: CurveType.convex,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  height: screenHeight * .3,
                  width: screenWidth - 100,
                  color: baseColor,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ClayContainer(
                      color: baseColor,
                      height: screenHeight * .3,
                      width: screenWidth - 200,
                      borderRadius: 20,
                      curveType: CurveType.concave,
                      spread: 30,
                      depth: calculatedFirstDepth.toInt(),
                      child: Center(
                        child: ClayContainer(
                          height: screenHeight * .28,
                          width: screenWidth - 300,
                          borderRadius: 20,
                          depth: calculatedSecondDepth.toInt(),
                          curveType: CurveType.convex,
                          color: baseColor,
                          child: Center(
                            child: ClayContainer(
                              height: screenHeight * .25,
                              width: screenWidth - 400,
                              borderRadius: 20,
                              color: baseColor,
                              depth: calculatedThirdDepth.toInt(),
                              curveType: CurveType.concave,
                              child: Center(
                                child: ClayContainer(
                                  height: screenHeight * .2,
                                  width: screenWidth - 500,
                                  borderRadius: 20,
                                  color: baseColor,
                                  depth: calculatedFourthDepth.toInt(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container glowContainerTimeline(
      double screenHeight,
      double calculatedFirstDepth,
      double calculatedSecondDepth,
      double calculatedThirdDepth,
      double calculatedFourthDepth) {
    return Container(
      height: screenHeight * .45,
      width: 100,
      child: timelineTile.TimelineTile(
        indicatorStyle: timelineTile.IndicatorStyle(
          height: screenHeight * .15,
          width: screenHeight * .15,
          color: Colors.transparent,
          drawGap: true,
          indicatorXY: 0.52,
          padding: const EdgeInsets.only(top: 3, bottom: 2),
          indicator: Center(
            child: ClayContainer(
              color: const Color(0xffF13D3D),
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
                  color: const Color(0xff05261C),
                  child: Center(
                    child: ClayContainer(
                      height: screenHeight * .2,
                      width: screenHeight * .2,
                      borderRadius: 150,
                      spread: 3,
                      color: const Color(0xff0A5743),
                      depth: calculatedThirdDepth.toInt(),
                      curveType: CurveType.concave,
                      child: Center(
                        child: ClayContainer(
                          height: screenHeight * .08,
                          width: screenHeight * .08,
                          spread: 3.5,
                          borderRadius: 150,
                          color: const Color(0xff043D2E),
                          depth: calculatedFourthDepth.toInt(),
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
