import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final  controllertext = Get.put(textController());

class textController extends GetxController {
  Showtext(BuildContext context ,String text) {
    return  SizedBox(
      width: ScreenSize.pSize_300(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
            text,
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontFamily: 'rohan',
                fontWeight: FontWeight.w600,
                fontSize:
                ScreenSize.pSize_16(),
                color: Colors.black)),
      ),
    );
  }
}
