import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../Global_Data/global.dart';
import '../../Media_Qury/Media_Qury.dart';

class Get_Start extends StatelessWidget {
  Get_Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.pSize_70()),
                  Image(
                      height: ScreenSize.pSize_300(),
                      image: AssetImage(
                          'asset/image/4598fa955b006ac51d8355884c41afa7.png')),
                  Text(
                    'Aadhar Loan',
                    style: TextStyle(
                      fontSize: ScreenSize.pSize_30(),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.black26,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ],
                      color: Color.fromRGBO(98, 104, 208, 1),
                    ),
                  ),
                  Text(
                    'Guide',
                    style: TextStyle(
                        fontSize: ScreenSize.pSize_30(),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.black26,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ],
                        color: Color.fromRGBO(98, 104, 208, 1)),
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 9.3),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          height: ScreenSize.pSize_200(),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('asset/image/Vector 1.png'),
                          )),
                          child: GestureDetector(
                            onTap: () {
                              // tapController.tapbutton(context, '/Aadhar_Loan_Guide', '', transition);
                              Get.offAndToNamed("/Aadhar_Loan_Guide");
                            },
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: ScreenSize.pSize_40()),
                                  Text('Get Started',
                                      style: TextStyle(
                                          fontSize: ScreenSize.pSize_40(),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'discrip',
                                          shadows: [
                                            Shadow(
                                                color: Colors.black26,
                                                blurRadius: 7,
                                                offset: Offset(0, 4))
                                          ],
                                          color: Color.fromRGBO(98, 104, 208, 1))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenSize.pSize_20(),
                        left: ScreenSize.pSize_30(),
                        child: Container(
                          width: ScreenSize.pSize_70(),
                          height: ScreenSize.pSize_70(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.9,
                                  offset: Offset(0, 5),
                                  blurRadius: 1,
                                  color: Colors.black12),
                            ],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Share.share(
                                  'https://fonts.google.com/specimen/Roboto?preview.text=lorem_ipsum&preview.text_type=custom');
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                    height: ScreenSize.pSize_25(),
                                    image: AssetImage(
                                        'asset/image/share-icon.png')),
                                SizedBox(height: ScreenSize.pSize_4()),
                                Text('Share',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenSize.pSize_13(),
                                        color:
                                            Color.fromRGBO(98, 104, 208, 1))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenSize.pSize_20(),
                        right: ScreenSize.pSize_50(),
                        child: Container(
                          width: ScreenSize.pSize_70(),
                          height: ScreenSize.pSize_70(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.9,
                                  offset: Offset(0, 5),
                                  blurRadius: 1,
                                  color: Colors.black12),
                            ],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              tapController.tapbutton(
                                  context, '/In_App_Privacy', '/Get_Start','',transition);

                              // controller.showbuttonad(context, '/In_App_Privacy', '');
                              // Get.to(() => const In_App_Privacy());
                            },
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      height: ScreenSize.pSize_28(),
                                      image: AssetImage(
                                          'asset/image/privacy-icon.png')),
                                  SizedBox(height: ScreenSize.pSize_4()),
                                  Text('Privacy',
                                      style: TextStyle(
                                          fontSize: ScreenSize.pSize_13(),
                                          color:
                                              Color.fromRGBO(98, 104, 208, 1))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            banner.BANNER('/Get_Start'),
          ],
        ),
      ),
    );
  }
}
