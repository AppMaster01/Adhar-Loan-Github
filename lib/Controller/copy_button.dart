import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Media_Qury/Media_Qury.dart';

String CopyText =
    "https://www.bajajfinserv.in/instant-personal-loan-on-aadhar-card";
final copy = Get.put(copybutton());

class copybutton extends GetxController {
  getcopy() {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: CopyText));
        Fluttertoast.showToast(
          msg: "Link copied",
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3,
          textColor: Color.fromRGBO(98, 104, 208, 1),
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          fontSize: 15,
        );
      },
      child: Container(
        width: ScreenSize.pSize_200(),
        height: ScreenSize.pSize_55(),
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
    );
  }
}
