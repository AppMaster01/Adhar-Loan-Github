//
// import 'dart:convert';
// import 'package:adhar_loan/All_Typs_Ads/Google_Ads/Ads.dart';
// import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// import '../../Addres_Change/Addres_Change.dart';
// import '../../Adhar_Guide_Deails_Page/Detail.dart';
// import 'holiday_model.dart';
//
// class Bank_holiday_Detail extends StatelessWidget {
//   const Bank_holiday_Detail({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(98, 104, 208, 1),
//         title: Text('Bank Service',
//             style: TextStyle(
//                 fontSize: ScreenSize.pSize_20(),
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white)),
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10))),
//       ),
//       body: Stack(
//         children: [
//           FutureBuilder(
//             future:
//             DefaultAssetBundle.of(context).loadString("Jsonfile/banklist.json"),
//             builder: (context, snapshot) {
//               var jsondata = json.decode(snapshot.data.toString());
//               if (snapshot.hasData) {
//                 return holidayUsers(jsondata);
//               } else {
//                 return const Text("No data");
//               }
//             },
//           ),
//           banner.getBN(),
//         ],
//       ),
//     );
//   }
// }
//
// Widget holidayUsers(holidayuser) {
//   Holiday Users = Holiday.fromJson(holidayuser);
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: ListView.separated(
//       shrinkWrap: true,
//       itemCount:Users.bankHoliDay!.length,
//       itemBuilder: (context, index) {
//         return Container(
//           height: ScreenSize.pSize_55(),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6),
//               color: Color.fromRGBO(248, 248, 255, 1),
//               boxShadow: [
//                 BoxShadow(
//                     offset: Offset(0.5, 1.2),
//                     color: Colors.black26,
//                     blurRadius: 1)
//               ]),
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: SizedBox(
//                   width: ScreenSize.pSize_300(),
//                   child: Text(
//                       Users.bankHoliDay![holidayuser].fulltDate![index].toString(),
//                       overflow: TextOverflow.fade,
//                       style: TextStyle(
//                           fontFamily: 'rohan',
//                           fontSize:
//                           ScreenSize.pSize_16(),
//                           color: Colors.black)),
//                 ),
//               ),
//               // SizedBox(width: 100),
//             ],
//           ),
//         );
//       },
//       separatorBuilder:
//           (BuildContext context, int index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color.fromRGBO(248, 248, 255, 1),
//                   boxShadow: [
//                     BoxShadow(
//                         offset: Offset(1, 3),
//                         color: Colors.black26,
//                         blurRadius: 3)
//                   ]),
//               child: (index + 1) % 4 == 2
//                   ? FutureBuilder(
//                 builder: (context, snapshot) {
//                   return snapshot.connectionState ==
//                       ConnectionState.done
//                       ? Center(
//                       child: SizedBox(
//                         height: ScreenSize
//                             .pSize_160(),
//                         child: AdWidget(
//                           ad: snapshot.data,
//                           key: Key(
//                               index.toString()),
//                         ),
//                       ))
//                       : Container(
//                     height: ScreenSize
//                         .pSize_150(),
//                     child: const Center(
//                       child:
//                       CircularProgressIndicator(),
//                     ),
//                   );
//                 },
//                 future: getNative.getData(),
//               )
//                   : Container()),
//         );
//       },
//     ),
//   );
// }
import 'dart:convert';

import 'package:adhar_loan/All_Typs_Ads/Google_Ads/Ads.dart';
import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Screen/Bank_holiday/Bank_holiday_Detail/holiday_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../Global_Data/global.dart';
import '../../../Media_Qury/Media_Qury.dart';
import '../../Addres_Change/first/Addres_Change.dart';

class Bank_holiday_Detail extends StatelessWidget {
  const Bank_holiday_Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Bank_Holiday', '/Bank_holiday_Detail', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(98, 104, 208, 1),
          title: Text('Bank Service',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: Stack(
          children: [
            FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("Jsonfile/bankholiday.json"),
              builder: (context, snapshot) {
                var jsondata = json.decode(snapshot.data.toString());
                if (snapshot.hasData) {
                  return buildUsers(jsondata);
                } else {
                  return const Text("No data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildUsers(users) {
  Holiday User = Holiday.fromJson(users);
  return Stack(
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
                itemCount: User.bankHoliDay!.length,
                itemBuilder: (context, indexs) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: ScreenSize.pSize_65(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(248, 248, 255, 1),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 1.8),
                                color: Colors.black26,
                                blurRadius: 1.5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                User.bankHoliDay![indexs].holiDayName
                                    .toString(),
                                style: TextStyle(
                                    color: Color.fromRGBO(98, 104, 208, 1),
                                    fontSize: ScreenSize.pSize_18(),
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: ScreenSize.pSize_4()),
                            Text(User.bankHoliDay![indexs].fulltDate.toString(),
                                style: TextStyle(
                                    fontSize: ScreenSize.pSize_15(),
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
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
                            color: Color.fromRGBO(248, 248, 255, 1),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 3),
                                  color: Colors.black26,
                                  blurRadius: 3)
                            ]),
                        child: (index + 1) % 15 == 0
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
            ),
            SizedBox(height: ScreenSize.pSize_50()),
          ],
        ),
      ),
      banner.BANNER('/Bank_holiday_Detail')
    ],
  );
}
