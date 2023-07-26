import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/All_Typs_Ads/Google_Ads/Ads.dart';
import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../Futur/future.dart';
import '../../../Global_Data/global.dart';
import '../model_class.dart';

GetNative getNative = GetNative();
GetBanner getBanner = GetBanner();

class Address_Change extends StatelessWidget {
  Address_Change({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Aadhar_Loan_Guide', '/Address_Change', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
            backgroundColor: Color.fromRGBO(98, 104, 208, 1),
            centerTitle: true,
            title: Text(
              'Address Change',
              style: TextStyle(fontSize: ScreenSize.pSize_20()),
            )),
        body:
        Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: AadharQuestion.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(

                            onTap: () {
                              tapController.tapbutton(context, '/Adhar_Change_Details','/Address_Change', AadharlList[index],transition);
                              // controller.showbuttonad(context, '/Adhar_Change_Details',  AadharlList[index]);
                              // Get.to(() => Adhar_Change_Details(),
                              //     arguments: AadharlList[index]);
                            },
                            child: Container(
                              height: ScreenSize.pSize_50(),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0.5, 1.2),
                                        color: Colors.black26,
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0.8),
                                    child: SizedBox(
                                      width: ScreenSize.pSize_300(),
                                      child: Text(AadharQuestion[index],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'rohan',
                                              fontSize: ScreenSize.pSize_16(),
                                              color: Colors.black)),
                                    ),
                                  ),
                                  // SizedBox(width: 100),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                child: (index + 1) % 5 == 0
                                    ? FutureBuilder(
                                        builder: (context, snapshot) {
                                          return snapshot.connectionState ==
                                                  ConnectionState.done
                                              ? Stack(
                                                children: [
                                                  Center(
                                                      child: SizedBox(
                                                      height:
                                                          ScreenSize.pSize_160(),
                                                      child: AdWidget(
                                                        ad: snapshot.data,
                                                        key: Key(index.toString()),
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
                    ),
                  ),
                  SizedBox(height: ScreenSize.pSize_80()),
                ],
              ),
            ),
            banner.BANNER('/Address_Change'),
          ],
        ),

      ),
    );
  }
}
