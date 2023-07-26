import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Global_Data/global.dart';
import 'package:flutter/material.dart';

import '../../../../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../../../../Media_Qury/Media_Qury.dart';
import 'model.dart';

class EPF_Online_Detail extends StatelessWidget {
  EPF_Online_Detail({Key? key}) : super(key: key);

  // Epf_Online epf_online = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Show_Details', '/EPF_Online_Detail', transition);
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
              'EPF Detail',
              style: TextStyle(fontSize: ScreenSize.pSize_20()),
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.pSize_10()),
                  native.getNT('/EPF_Online_Detail'),
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
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              EPF_Online_Descrip[index],
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
                  Container(
                    width: ScreenSize.pSize_225(),
                    height: ScreenSize.pSize_50(),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(98, 104, 208, 25),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage('asset/image/copy-icon.png')),
                        SizedBox(width: ScreenSize.pSize_10()),
                        Text(
                          'COPY',
                          style: TextStyle(
                              fontFamily: 'rohan',
                              color: Colors.white,
                              fontSize: ScreenSize.pSize_28(),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.pSize_80()),
                ],
              ),
            ),
            banner.BANNER('/EPF_Online_Detail'),
          ],
        ),
      ),
    );
  }
}
