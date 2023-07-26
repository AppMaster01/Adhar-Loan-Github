import 'package:flutter/material.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../Global_Data/global.dart';
import '../../../Media_Qury/Media_Qury.dart';
import 'model.dart';

class Link_To_Adhar extends StatelessWidget {
  Link_To_Adhar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Adhar_Show_Details', '/Link_To_Adhar', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          title: Text('Detail',
              style: TextStyle(
                  fontSize: ScreenSize.pSize_20(),
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.pSize_20()),
                  native.getNT('/Link_To_Adhar'),
                  SizedBox(height: ScreenSize.pSize_20()),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 3),
                                color: Colors.black26,
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          text[index],
                          style: TextStyle(
                            fontFamily: 'Decrip',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.pSize_50()),
                ],
              ),
            ),
            banner.BANNER('/Link_To_Adhar'),
          ],
        ),
      ),
    );
  }
}
