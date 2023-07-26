// ignore_for_file: non_constant_identifier_names

import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:flutter/material.dart';
import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Controller/Widget_controller.dart';
import '../../../Controller/copy_button.dart';
import '../../../Global_Data/global.dart';
import '../../Addres_Change/first/Addres_Change.dart';
import 'Details_Model/Claim/model.dart';
import 'Details_Model/EPF/model.dart';

class Show_Details extends StatelessWidget {
  Show_Details({Key? key}) : super(key: key);
  Epf_Detail epf_detail = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/EPF_Service', '/Show_Details', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          title: Text(epf_detail.Epf_Detail_Text,
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
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: epf_detail.Epf_Description != """"""
                          ? Column(
                              children: [
                                native.getNT('/Show_Details'),
                                SizedBox(height: ScreenSize.pSize_20()),
                                Container(
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
                                      Description[index],
                                      style: TextStyle(
                                        fontFamily: 'Decrip',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : epf_detail.Loan_Tips != """"""
                              ? Column(
                                  children: [
                                    native.getNT('/Show_Details'),
                                    SizedBox(height: ScreenSize.pSize_30()),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(1, 3),
                                                color: Colors.black26,
                                                blurRadius: 3)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          children: [
                                            Text(
                                              epf_detail.Loan_Tips,
                                              style: TextStyle(
                                                fontFamily: 'Descrip',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                                height: ScreenSize.pSize_10()),
                                            Text(
                                              epf_detail.number,
                                              style: TextStyle(
                                                fontFamily: 'Descrip',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenSize.pSize_40(),
                                    ),
                                    copy.getcopy(),
                                  ],
                                )
                              : epf_detail.Loan_Tips2 != """"""
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        controller2.ShowContainer(
                                            context,
                                            "asset/image/claim-icon.png",
                                            'Your Claim \n\t\t\tStatus'),
                                        SizedBox(width: ScreenSize.pSize_6()),
                                        controller2.ShowContainer(
                                            context,
                                            "asset/image/activity-UNA-icon.png",
                                            'Member \n\t\Claim'),
                                        SizedBox(width: ScreenSize.pSize_6()),
                                        controller2.ShowContainer(
                                            context,
                                            "asset/image/Apply-claim-icon.png",
                                            'Apply for  \n\t\tStatus')
                                      ],
                                    )
                                  : epf_detail.number2 == """"""
                                      ? ListView.separated(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          itemCount: Epf_Online_Text.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                tapController.tapbutton(
                                                    context,
                                                    '/EPF_Online_Detail',
                                                    '/Show_Details',
                                                    '',
                                                    transition);
                                              },
                                              child: Container(
                                                height: ScreenSize.pSize_55(),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset:
                                                              Offset(0.5, 1.2),
                                                          color: Colors.black26,
                                                          blurRadius: 1)
                                                    ]),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: SizedBox(
                                                        width: ScreenSize
                                                            .pSize_300(),
                                                        child: Text(
                                                            Epf_Online_Text[
                                                                index],
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'text',
                                                                fontSize: ScreenSize
                                                                    .pSize_15(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        98,
                                                                        104,
                                                                        208,
                                                                        1))),
                                                      ),
                                                    ),
                                                    // SizedBox(width: 100),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 3),
                                                            color:
                                                                Colors.black26,
                                                            blurRadius: 3)
                                                      ]),
                                                  child: (index + 1) % 5 == 0
                                                      ? FutureBuilder(
                                                    builder: (context, snapshot) {
                                                      return snapshot.connectionState ==
                                                          ConnectionState.done
                                                          ? Stack(
                                                        children: [
                                                          Center(
                                                              child: SizedBox(
                                                                height: ScreenSize
                                                                    .pSize_145(),
                                                                child: AdWidget(
                                                                  ad: snapshot.data,
                                                                  key: Key(
                                                                      index.toString()),
                                                                ),
                                                              )),
                                                          Positioned(
                                                            top: 5,
                                                            left: 5,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                  Color.fromRGBO(
                                                                      0,
                                                                      194,
                                                                      255,
                                                                      1),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5)),
                                                              height: ScreenSize
                                                                  .pSize_15(),
                                                              width: ScreenSize
                                                                  .pSize_25(),
                                                              child: Center(
                                                                child: Text('Ad',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                        ScreenSize
                                                                            .pSize_10())),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                          : Container(
                                                        height:
                                                        ScreenSize.pSize_150(),
                                                        child: const Center(
                                                          child:
                                                          CircularProgressIndicator(),
                                                        ),
                                                      );
                                                    },
                                                    future: getNative.getData(),
                                                  )
                                                      : Container()),
                                            );
                                          },
                                        )
                                      : Container(
                                          height: 10,
                                          width: 10,
                                          color: Colors.red,
                                        ),
                    ),
                    SizedBox(height: ScreenSize.pSize_45()),
                  ],
                ),
              ),
            ),
            banner.BANNER('/Show_Details'),
          ],
        ),
      ),
    );
  }
}
