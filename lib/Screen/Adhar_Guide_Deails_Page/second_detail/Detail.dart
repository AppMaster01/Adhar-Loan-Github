import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../Controller/copy_button.dart';
import '../../../Global_Data/global.dart';
import '../model.dart';
import '../../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../../Media_Qury/Media_Qury.dart';

// int index = 0;

class Adhar_guide_Details extends StatelessWidget {
  Adhar_guide_Details({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Adhar_guide', '/Adhar_guide_Details', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                )),
            backgroundColor: Color.fromRGBO(98, 104, 208, 25),
            centerTitle: true,
            title: Text(
              'Detail',
              style: TextStyle(fontSize: ScreenSize.pSize_20()),
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.pSize_10()),
                  native.getNT('/Adhar_guide_Details'),
                  SizedBox(height: ScreenSize.pSize_20()),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(248, 248, 255, 1),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 4),
                                color: Colors.black26,
                                blurRadius: 2)
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              Question_Description[index],
                              style: TextStyle(
                                fontFamily: 'rohan',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.pSize_30()),
                  copy.getcopy(),
                  SizedBox(height: ScreenSize.pSize_80()),
                ],
              ),
            ),
            banner.BANNER('/Adhar_guide_Details'),
          ],
        ),
      ),
    );
  }
}
