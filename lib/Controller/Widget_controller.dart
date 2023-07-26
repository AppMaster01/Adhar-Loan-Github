// ignore_for_file: non_constant_identifier_names

import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Global_Data/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Media_Qury/Media_Qury.dart';
import 'copy_button.dart';

String CopyText =
    "https://www.bajajfinserv.in/instant-personal-loan-on-aadhar-card";
final containerController controller2 = Get.put(containerController());
final banklistrController controller1 = Get.put(banklistrController());

class containerController extends GetxController {
  ShowContainer(BuildContext context, String image, String name) {
    return GestureDetector(
      onTap: () {
        tapController.tapbutton(context, '/Claim_Details', '/Show_Details','', transition);
        // Get.to(() => Claim_Details());
      },
      child: Container(
        height: ScreenSize.pSize_130(),
        width: ScreenSize.pSize_100(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border:
              Border.all(width: 1.2, color: Color.fromRGBO(98, 104, 208, 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(height: ScreenSize.pSize_40(), image: AssetImage(image)),
            SizedBox(height: ScreenSize.pSize_10()),
            Text(name,
                style: TextStyle(
                    fontSize: ScreenSize.pSize_16(),
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(98, 104, 208, 1))),
          ],
        ),
      ),
    );
  }
}

class banklistrController extends GetxController {
  ShowList(BuildContext context ,String image, String bankname,
      String number, var icon, var icon2) {
    return Container(
      height: ScreenSize.pSize_80(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color.fromRGBO(248, 248, 255, 1),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 3), color: Colors.black26, blurRadius: 1)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage(image)),
            SizedBox(width: ScreenSize.pSize_10()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bankname,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenSize.pSize_20(),
                        color: Color.fromRGBO(98, 104, 208, 1))),
                SizedBox(width: ScreenSize.pSize_10()),
                Text(number,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenSize.pSize_17(),
                        color: Colors.black45)),
              ],
            ),
            SizedBox(width: ScreenSize.pSize_80()),
            GestureDetector(
              onTap: () {
                copy.getcopy();
              },
              child:
                  Image(height: ScreenSize.pSize_28(), image: AssetImage(icon)),
            ),
            SizedBox(width: ScreenSize.pSize_6()),
            Image(height: ScreenSize.pSize_28(), image: AssetImage(icon2)),
          ],
        ),
      ),
    );
  }
}
