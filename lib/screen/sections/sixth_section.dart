
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oavltd/bloc/screen_offset.dart';
import 'package:oavltd/model/news.dart';
import 'package:oavltd/screen/widget/news_card.dart';
import 'package:oavltd/screen/widget/text_reveal.dart';

import '../../constant/color.dart';

class SixthSection extends StatefulWidget {
  const SixthSection({super.key});

  @override
  State<SixthSection> createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection>
    with TickerProviderStateMixin {
  @override
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            if ((current.scrollOffsetValue >= 2800 &&
                    current.scrollOffsetValue <= 4500) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state.scrollOffsetValue > 4200.0) {
              //print(state.scrollOffsetValue);
              controller.forward();
            } else {
              controller.reverse();
            }
            return Column(
              children: [
                TextReveal(
                  maxHeight: 70,
                  controller: controller,
                  child: const Text(
                    'TESTIMONIALS',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextReveal(
                  maxHeight: 70,
                  controller: controller,
                  child: const Text(
                    'Evidence Our Quality Services',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 400,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: news
                          .map((news) => NewsCard(
                                news,
                              ))
                          .toList()),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
