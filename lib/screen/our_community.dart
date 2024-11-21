
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oavltd/bloc/screen_offset.dart';
import 'package:oavltd/screen/sections/bottom_bar.dart';
import 'package:oavltd/screen/widget/responsive.dart';
import 'package:oavltd/screen/widget/text_reveal.dart';
import 'package:oavltd/screen/widget/text_transform.dart';

class JoinCommunityScreen extends StatefulWidget {
  const JoinCommunityScreen({super.key});

  @override
  State<JoinCommunityScreen> createState() => _JoinCommunityScreenState();
}

class _JoinCommunityScreenState extends State<JoinCommunityScreen> with SingleTickerProviderStateMixin {

  
 late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  
  

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }




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

   late ScrollController controllers;
double _scrollPosition = 0;
  double _opacity = 0;

    _scrollListener() {
    setState(() {
      _scrollPosition = controllers.position.pixels;
    });
  }

@override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    textRevealAnimation = Tween<double>(begin: 60.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.2, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });

    controllers = ScrollController();
    controllers.addListener(_scrollListener);

    controllers.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controllers.position.pixels)
              .toInt());
    });
    super.initState();
  }


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
                      onTap: () {},
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
                  'Join Our Community',
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
                      fontSize: 14,
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
      body: ListView(
      controller: controllers,
      children: [
ResponsiveWidget.isSmallScreen(context)
          ? 
           Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.darken,),
          image: AssetImage('assets/images/comm.jpg'))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextReveal(
                    maxHeight: 50,
                    controller: controller,
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    child: const Text(
                      'About the Community',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  
                  const SizedBox(
                    height: 18,
                  ),
                  TextTransform(
                    maxHeight: 80,
                    controller: controller,
                    textOpacityAnimation: textOpacityAnimation,
                    //textRevealAnimation: textRevealAnimation,
                    child: const Text(
                      'launched on September 27th, 2024.\nDesigned as a support hub for livestock farmers.',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  
                ],
              ),
            ),
          ),
          //const Expanded(flex: 9, child: FirstPageImage())
        ],
      ),
    )
          : Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.darken,),
          image: AssetImage('assets/images/comm.jpg'))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 90, top: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextReveal(
                    maxHeight: 100,
                    controller: controller,
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    child: const Text(
                      'About the Community',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  TextTransform(
                    maxHeight: 100,
                    controller: controller,
                    textOpacityAnimation: textOpacityAnimation,
                    //textRevealAnimation: textRevealAnimation,
                    child: const Text(
                                        'launched on September 27th, 2024.\nDesigned as a support hub for livestock farmers.',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  
                   
                ],
              ),
            ),
          ),
          //const Expanded(flex: 9, child: FirstPageImage())
        ],
      ),
    ),
//SecondScreen(),
        const SizedBox(
          height: 100.0,
        ),
         Center(
           child: TextReveal(
                      maxHeight: 50,
                      controller: controller,
                      textOpacityAnimation: textOpacityAnimation,
                      textRevealAnimation: textRevealAnimation,
                      child: const Text(
                        'Onoseke-vwe Agro Ventures Ltd Community,',
                        style: TextStyle(
                            fontFamily: 'CH',
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
         ),
          Center(
            child: TextTransform(
                      maxHeight: 100,
                      controller: controller,
                      textOpacityAnimation: textOpacityAnimation,
                      //textRevealAnimation: textRevealAnimation,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Text(
                          'OAVL Community : Designed specially for livestock farmers.\nThe go-to support hub for livestock farmers. Join the community via this link either on WhatsApp or Facebook.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'CH',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
          ),
           const SizedBox(
          height: 60.0,
        ),
        Center(
           child: TextReveal(
                      maxHeight: 50,
                      controller: controller,
                      textOpacityAnimation: textOpacityAnimation,
                      textRevealAnimation: textRevealAnimation,
                      child: const Text(
                        'Steps to Join',
                        style: TextStyle(
                            fontFamily: 'CH',
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
         ),
          Center(
            child: TextTransform(
                      maxHeight: 100,
                      controller: controller,
                      textOpacityAnimation: textOpacityAnimation,
                      //textRevealAnimation: textRevealAnimation,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Text(
                          '> Visit our social handle below.\n\n> Get access to Knowledge.\n\n> Finance opportunities.\n\n> Market opportunities..',
                          textAlign: TextAlign.center,
                          
                          style: TextStyle(
                              fontFamily: 'CH',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
          ),
        
        const SizedBox(
          height: 100.0,
        ),
        const BottomBar(),
      ],
    )
    );
      }
}