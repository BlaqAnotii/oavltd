import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final  String  s4;
     VoidCallback ? ontap;


  BottomBarColumn({
    this.ontap,
   required  this.s4,
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
                                    fontFamily: 'CH',

              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: ontap,
            child: Text(
              s1,
              style: TextStyle(
                                      fontFamily: 'CH',
            
                color: Colors.blueGrey[100],
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: ontap,
            child: Text(
              s2,
              style: TextStyle(
                                      fontFamily: 'CH',
            
                color: Colors.blueGrey[100],
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: ontap,
            child: Text(
              s3,
              style: TextStyle(
                                      fontFamily: 'CH',
            
                color: Colors.blueGrey[100],
                fontSize: 12,
              ),
            ),
          ),
                    const SizedBox(height: 5),
           GestureDetector(
            onTap: ontap,
            child: Text(
              s4,
              style: TextStyle(
                                      fontFamily: 'CH',
            
                color: Colors.blueGrey[100],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
