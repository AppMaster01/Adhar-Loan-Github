import 'dart:async';

import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/My_Controller.dart';

class Splash_Screen extends StatelessWidget {
  Splash_Screen({Key? key}) : super(key: key);

  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: ScreenSize.pSize_130(),
                  image: AssetImage('asset/image/logo-icon.png')),
              SizedBox(height: ScreenSize.pSize_70()),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image(
                      width: ScreenSize.horizontalBlockSize! * 99.900,
                      image: AssetImage('asset/image/Vector 1.png')),
                ),
                Positioned(
                  top: ScreenSize.pSize_45(),
                  child: Text(
                    'Aadhar Loan \n\t\t\t\t\t\tGuide',
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.black26,
                              blurRadius: 7,
                              offset: Offset(0, 3.5)),
                        ],
                        // fontFamily: 'text',
                        fontSize: ScreenSize.pSize_34(),
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(98, 104, 208, 1)),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
