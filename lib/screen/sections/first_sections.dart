
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oavltd/constant/color.dart';
import 'package:oavltd/screen/widget/responsive.dart';
import 'package:oavltd/screen/widget/text_transform.dart';

import '../widget/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
            var screenSize = MediaQuery.of(context).size;

    return ResponsiveWidget.isSmallScreen(context)
          ? 
           Container(
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.jpg'))),
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
                      'Empowering Livestock Farmers,',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  TextReveal(
                    maxHeight: 50,
                    controller: controller,
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    child: const Text(
                      'Ensuring Food Security Across Africa',
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
                      'With 25+ years of years experience,we are committed to providing high-quality agro-inputs\nand innovative solutions to boost productivity and food security.',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 13,
                          color: Colors.amber,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                                                  context.go('/About_Us');

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                            fixedSize: const Size(150, 50),
                            backgroundColor:  Colors.blueGrey[900],),
                        child: const Text(
                          'Learn more  >>',
                          style: TextStyle(
                            fontFamily: 'CH',
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ),
          //const Expanded(flex: 9, child: FirstPageImage())
        ],
      ),
    )
          : Container(
      height: 600,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.jpg'))),
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
                      'Empowering Livestock Farmers,',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  TextReveal(
                    maxHeight: 100,
                    controller: controller,
                    textOpacityAnimation: textOpacityAnimation,
                    textRevealAnimation: textRevealAnimation,
                    child: const Text(
                      'Ensuring Food Security Across Africa',
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
                      'With 25+ years of years experience,we are committed to providing high-quality agro-inputs\nand innovative solutions to boost productivity and food security.',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 14,
                          color: Colors.amber,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                                                  context.go('/About_Us');

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                            fixedSize: const Size(190, 50),
                            backgroundColor:  Colors.blueGrey[900],),
                        child: const Text(
                          'Learn more  >>',
                          style: TextStyle(
                            fontFamily: 'CH',
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      
                    ],
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
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 775));

    _animation = Tween<double>(begin: 920.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
    Future.delayed(const Duration(milliseconds: 375), () {
      if (_controller.isDismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              height: 920.0,
              width: double.infinity,
              child: child,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _animation.value,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.scaffoldColor,
                      AppColors.secondaryColor,
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: Transform.scale(
        scale: 1,
        child: Image.asset(
          'assets/images/Frame 27.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
