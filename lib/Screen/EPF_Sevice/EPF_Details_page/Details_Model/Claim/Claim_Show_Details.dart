import 'package:flutter/material.dart';

import '../../../../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../../../../Media_Qury/Media_Qury.dart';
import '../../../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../../../Controller/copy_button.dart';
import '../../../../../Global_Data/global.dart';

class Claim_Details extends StatelessWidget {
  const Claim_Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(context, '/Show_Details', '/Claim_Details', transition);
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
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.pSize_10()),
                  native.getNT('/Claim_Details'),
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
                              """✤ Step 1: Login to the Unified Portal of Employees’ Provident Fund (https://unifiedportal.epfindia.gov.in/) and click on For employees, followed by UAN Member e-Sewa.

✤ Step 2: Enter UAN and password to log in to the portal.

✤ Step 3: Click on Manage on the top panel and then on KYC

✤ Step 4: On the next page, under Add KYC tab, provide your bank, PAN and Aadhaar, passport, driving license, election card and ration card details. Then click on submit. After submitting, you can find these details under Pending KYC tab. Once approved by the employer (which would generally take 15 days), it will be shown under Approved KYC tab.

✤ Linking of your Aadhaar to EPF account will help in faster withdrawal and transfer process and for that, the present employer should have approved and verified the KYC including the employees Aadhaar details.""",
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
            banner.BANNER('/Claim_Details'),
          ],
        ),
      ),
    );
  }
}
