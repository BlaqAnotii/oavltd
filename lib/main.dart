
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:oavltd/bloc/screen_offset.dart';
import 'package:oavltd/model/about_us.dart';
import 'package:oavltd/screen/about_us.dart';
import 'package:oavltd/screen/contact_us.dart';
import 'package:oavltd/screen/our_community.dart';
import 'package:oavltd/screen/our_service.dart';
import 'package:oavltd/screen/whole_screen.dart';
import 'package:oavltd/screen/widget/responsive.dart';


void main() {
    WidgetsFlutterBinding.ensureInitialized();

   final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: <RouteBase>[
      
        GoRoute(
          path: 'home',
          builder: (context, GoRouterState state) {
            return const MyHomePage();
          },
        ),
        GoRoute(
          path: 'About_Us',
          builder: (context, GoRouterState state) {
            return const AboutUsScreen();
          },
        ),
        GoRoute(
          path: 'Our_Services',
          builder: (context, GoRouterState state) {
            return const OurServiceScreen();
          },
        ),
         GoRoute(
          path: 'Contact_us',
          builder: (context, GoRouterState state) {
            return const ContactUsScreen();
          },
        ),
         GoRoute(
          path: 'join_community',
          builder: (context, GoRouterState state) {
            return const JoinCommunityScreen ();
          },
        ),
        GoRoute(
          path: 'whatsapp',
          builder: (context, GoRouterState state) {
            return const Link();
          },
        ),
        // GoRoute(
        //   path: 'join-business',
        //   builder: (context, GoRouterState state) {
        //     return const JoinBusinessView();
        //   },
        // )
      ],
    ),
  ],
);
  runApp(MyApp(router: router,));
}

class MyApp extends StatefulWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Onoseke-vwe Agro Ventures Ltd',
      theme: ThemeData(
        useMaterial3: true,
      ),
        routerConfig: widget.router,

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
        var screenSize = MediaQuery.of(context).size;
 _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: 
      ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Colors.blueGrey[900],
              elevation: 0,
              centerTitle: true,
         leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer();  // Opens the drawer using correct context
        },
      ),
    ),
              title: Text(
                'Onoseke-vwe Agro Ventures Ltd',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 17,
                  fontFamily: 'CH',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                ),
              ),
             
            )
          :
       PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                                  SizedBox(width: screenSize.width / 30),

              Text(
                'Onoseke-vwe Agro Ventures Ltd',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'CH',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 7),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {
                        context.go('/About_Us');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About Us',
                            style: TextStyle(
                                                fontFamily: 'CH',
                              color: _isHovering[0]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                     SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {
                                                context.go('/Our_Services');

                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Our Services',
                            style: TextStyle(
                             fontFamily: 'CH',
                              color: _isHovering[1]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {
                                                                              context.go('/Contact_us');

                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                             fontFamily: 'CH',
                              color: _isHovering[2]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                     SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {
                                                                        context.go('/join_community');

                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Join Our Community',
                            style: TextStyle(
                             fontFamily: 'CH',
                              color: _isHovering[3]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // IconButton(
              //   icon: const Icon(Icons.brightness_6),
              //   splashColor: Colors.transparent,
              //   highlightColor: Colors.transparent,
              //   color: Colors.white,
              //   onPressed: () {
              //     EasyDynamicTheme.of(context).changeTheme();
              //   },
              // ),
              SizedBox(
                width: screenSize.width / 20,
              ),
         
            ],
          ),
        ),
      ),
    ),
    drawer:  
        Drawer(
      child: Container(
        color:  Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  context.go('/About_Us');
                },
                child: const Text(
                  'About Us',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'CH'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                                    context.go('/Our_Services');
                },
                child: const Text(
                  'Our Services',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'CH'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                                                      context.go('/Contact_us');

                },
                child: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'CH'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                                  context.go('/join_community');

                },
                child: const Text(
                  'Join Community',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'CH'),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2024 | Onoseke-vwe Agro Ventures Ltd',
                    style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: 12,
                      fontFamily: 'CH'
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
      body: BlocProvider(
        create: (context) => DisplayOffset(ScrollOffset(scrollOffsetValue: 0)),
        child: const WholeScreen(),
      ),
    );
  }
}
