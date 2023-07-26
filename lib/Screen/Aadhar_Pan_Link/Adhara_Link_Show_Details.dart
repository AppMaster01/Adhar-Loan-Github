// ignore_for_file: non_constant_identifier_names

import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Global_Data/global.dart';
import 'package:adhar_loan/Screen/Aadhar_Pan_Link/model.dart';
import 'package:flutter/material.dart';
import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../Addres_Change/first/Addres_Change.dart';
import 'Important/answermodel.dart';
import 'link_to_adhar/model.dart';

class Adhar_Show_Details extends StatelessWidget {
  Adhar_Show_Details({Key? key}) : super(key: key);

  Adhar_Link adhar_link = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Adhar_Pan_Link', '/Adhar_Show_Details', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          title: Text(adhar_link.Page_Name,
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
                    adhar_link.Adhar_Link_Descrip != """"""
                        ? Column(
                            children: [
                              SizedBox(height: ScreenSize.pSize_20()),
                              native.getNT('/Adhar_Show_Details'),
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
                                      adhar_link.Adhar_Link_Descrip,
                                      style: TextStyle(
                                        fontFamily: 'decrip',
                                        fontSize: ScreenSize.pSize_15(),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : adhar_link.Adhar_Link_Descrip2 != """"""
                            ? Column(
                                children: [
                                  SizedBox(height: ScreenSize.pSize_20()),
                                  native.getNT('/Adhar_Show_Details'),
                                  SizedBox(height: ScreenSize.pSize_20()),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
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
                                        child: Text(
                                          adhar_link.Adhar_Link_Descrip2,
                                          style: TextStyle(
                                            fontFamily: 'Decrip',
                                            fontSize: ScreenSize.pSize_15(),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : adhar_link.Adhar_Link_Descrip3 != """"""
                                ? Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: ListView.separated(
                                      itemCount: Link_Required.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            tapController.tapbutton(
                                                context,
                                                '/Link_To_Adhar',
                                                '/Adhar_Show_Details',
                                                '',
                                                transition);
                                            // Get.to(() => Link_To_Adhar(),
                                            //     arguments: textlList[index]);
                                          },
                                          child: Container(
                                            height: ScreenSize.pSize_55(),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0.5, 1.2),
                                                      color: Colors.black26,
                                                      blurRadius: 1)
                                                ]),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    width:
                                                        ScreenSize.pSize_300(),
                                                    child: Text(
                                                        Link_Required[index],
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: TextStyle(
                                                            fontFamily: 'text',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: ScreenSize
                                                                .pSize_16(),
                                                            color:
                                                                Color.fromRGBO(
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
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
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
                                              child: (index + 1) % 4 == 2
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
                                    ),
                                  )
                                : adhar_link.Adhar_Link_Descrip4 != """"""
                                    ? Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: ListView.separated(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: question.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                tapController.tapbutton(
                                                    context,
                                                    '/inportent',
                                                    '/Adhar_Show_Details',
                                                    AnswerlList[index],
                                                    transition);
                                                // Get.to(() => inportent(),
                                                //     arguments:
                                                //         AnswerlList[index]);
                                              },
                                              child: Container(
                                                height: ScreenSize.pSize_70(),
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
                                                            question[index],
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'rohan',
                                                                fontSize: ScreenSize
                                                                    .pSize_14(),
                                                                color: Colors
                                                                    .black)),
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
                                                          builder: (context,
                                                              snapshot) {
                                                            return snapshot
                                                                        .connectionState ==
                                                                    ConnectionState
                                                                        .done
                                                                ? Stack(
                                                                  children: [
                                                                    Center(
                                                                        child:
                                                                            SizedBox(
                                                                        height: 200,
                                                                        child:
                                                                            AdWidget(
                                                                          ad: snapshot
                                                                              .data,
                                                                          key: Key(index
                                                                              .toString()),
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
                                                                    height: ScreenSize
                                                                        .pSize_150(),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    ),
                                                                  );
                                                          },
                                                          future: getNative
                                                              .getData(),
                                                        )
                                                      : Container()),
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                    SizedBox(height: ScreenSize.pSize_50()),
                  ],
                ),
              ),
            ),
            banner.BANNER('/Adhar_Show_Details'),
          ],
        ),
      ),
    );
  }
}
