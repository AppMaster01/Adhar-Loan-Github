import 'package:adhar_loan/Global_Data/global.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../Media_Qury/Media_Qury.dart';
import '../../Addres_Change/first/Addres_Change.dart';
import '../model.dart';

class Adhar_Pan_Link extends StatelessWidget {
  const Adhar_Pan_Link({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Aadhar_Loan_Guide', '/Adhar_Pan_Link', transition);
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
              'Aadhar Pan Link',
              style: TextStyle(fontSize: ScreenSize.pSize_20()),
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Adhar_Link_text.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            tapController.tapbutton(
                                context,
                                '/Adhar_Show_Details',
                                '/Adhar_Pan_Link',
                                AadharLinklList[index],
                                transition);
                            // Get.to(() => Adhar_Show_Details(),arguments: AadharLinklList[index]);
                          },
                          child: Container(
                            height: ScreenSize.pSize_55(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0.5, 1.2),
                                      color: Colors.black26,
                                      blurRadius: 1)
                                ]),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: ScreenSize.pSize_300(),
                                    child: Text(Adhar_Link_text[index],
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontFamily: 'text',
                                            fontWeight: FontWeight.w700,
                                            fontSize: ScreenSize.pSize_16(),
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
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
                              child: (index + 1) % 4 == 2
                                  ? FutureBuilder(
                                      builder: (context, snapshot) {
                                        return snapshot.connectionState ==
                                                ConnectionState.done
                                            ? Stack(
                                              children: [
                                                Center(
                                                    child: SizedBox(
                                                    height: ScreenSize.pSize_160(),
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
                                                height: ScreenSize.pSize_150(),
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
                  SizedBox(height: ScreenSize.pSize_80()),
                ],
              ),
            ),
            banner.BANNER('/Adhar_Pan_Link'),
          ],
        ),
      ),
    );
  }
}
