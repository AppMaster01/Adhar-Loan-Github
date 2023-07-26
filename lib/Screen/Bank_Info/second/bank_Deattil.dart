import 'dart:convert';

import 'package:adhar_loan/All_Typs_Ads/Google_Ads/Ads.dart';
import 'package:adhar_loan/Controller/Widget_controller.dart';
import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Screen/Bank_Info/first/model_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Global_Data/global.dart';
import '../../../Media_Qury/Media_Qury.dart';

class Bank_Service extends StatelessWidget {
  Bank_Service({Key? key}) : super(key: key);
  final Data aaaaa = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Bank_Details', '/Bank_Service', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          title: Text(aaaaa.bankName.toString(),
              style: TextStyle(
                  fontSize: ScreenSize.pSize_20(),
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("Json/banklist.json"),
          builder: (context, snapshot) {
            var jsondata = json.decode(snapshot.data.toString());
            if (snapshot.hasData) {
              return buildUsers(jsondata);
            } else {
              return const Text("No data");
            }
          },
        ),
      ),
    );
  }

  Widget buildUsers(Users) {
    Bank_Info User = Bank_Info.fromJson(Users);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: ScreenSize.pSize_80(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromRGBO(248, 248, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.5, 3),
                          color: Colors.black26,
                          blurRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("asset/image/bank-balance-icon.png")),
                      SizedBox(width: ScreenSize.pSize_10()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bank Balance",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  // fontFamily: 'rohan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenSize.pSize_18(),
                                  color: Color.fromRGBO(98, 104, 208, 1))),
                          Text(aaaaa.balanceNumber.toString(),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenSize.pSize_18(),
                                  color: Colors.black45)),
                        ],
                      ),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 22),
                      GestureDetector(
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
                        child: Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage("asset/image/copylink-icon.png")),
                      ),
                      SizedBox(width: ScreenSize.pSize_4()),
                      GestureDetector(
                        onTap: () {
                          Share.share(
                              '${aaaaa.bankName}\nBalance Number : ${aaaaa.balanceNumber} ');
                        },
                        child: Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage("asset/image/sharelink-icon.png")),
                      ),
                      SizedBox(width: ScreenSize.pSize_2()),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenSize.pSize_10()),
              Container(
                height: ScreenSize.pSize_80(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromRGBO(248, 248, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.5, 3),
                          color: Colors.black26,
                          blurRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("asset/image/statement-icon.png")),
                      SizedBox(width: ScreenSize.pSize_10()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mini Statement",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  // fontFamily: 'rohan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenSize.pSize_18(),
                                  color: Color.fromRGBO(98, 104, 208, 1))),
                          Text(aaaaa.miniNumber.toString(),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenSize.pSize_18(),
                                  color: Colors.black45)),
                        ],
                      ),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 21),
                      GestureDetector(
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
                        child: Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage("asset/image/copylink-icon.png")),
                      ),
                      SizedBox(width: ScreenSize.pSize_4()),
                      GestureDetector(
                        onTap: () {
                          Share.share(
                              '${aaaaa.bankName} \nMini Statement Number: ${aaaaa.miniNumber} ');
                        },
                        child: Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage("asset/image/sharelink-icon.png")),
                      ),
                      SizedBox(width: ScreenSize.pSize_2()),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ScreenSize.pSize_10()),
              Container(
                height: ScreenSize.pSize_80(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromRGBO(248, 248, 255, 1),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.5, 3),
                          color: Colors.black26,
                          blurRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image: AssetImage("asset/image/customer-care-icon.png")),
                      SizedBox(width: ScreenSize.pSize_10()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Customer Care Number",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  // fontFamily: 'rohan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenSize.pSize_18(),
                                  color: Color.fromRGBO(98, 104, 208, 1))),
                          Text(aaaaa.careNumber.toString(),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenSize.pSize_18(),
                                  color: Colors.black45)),
                        ],
                      ),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 6),
                      GestureDetector(
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
                        child: Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage("asset/image/copylink-icon.png")),
                      ),
                      SizedBox(width: ScreenSize.pSize_4()),
                      GestureDetector(
                        onTap: () {
                          Share.share(
                              '${aaaaa.bankName} \nCustomer Care Number :  ${aaaaa.careNumber} ');
                        },
                        child: Image(
                            height: ScreenSize.pSize_28(),
                            image: AssetImage("asset/image/sharelink-icon.png")),
                      ),
                      SizedBox(width: ScreenSize.pSize_2()),
                    ],
                  ),
                ),
              ),

            ],
          ),
          banner.BANNER('/Bank_Service')
        ],
      ),
    );
  }
}
