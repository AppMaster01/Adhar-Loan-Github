// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:adhar_loan/All_Typs_Ads/Google_Ads/Ads.dart';
import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:flutter/material.dart';

import '../../../Global_Data/global.dart';
import 'model_class.dart';

class Bank_Details extends StatelessWidget {
  const Bank_Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Aadhar_Loan_Guide', '/Bank_Details', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(98, 104, 208, 1),
          title: Text('Bank Service',
              style: TextStyle(
                  fontSize: ScreenSize.pSize_20(),
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
            banner.BANNER('/Bank_Details')
          ],
        ),
      ),
    );
  }

  Widget buildUsers(users) {
    Bank_Info User = Bank_Info.fromJson(users);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.pSize_10()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: User.data!.length,
              itemBuilder: (context, indexs) {
                return GestureDetector(
                  onTap: () {
                    tapController.tapbutton(
                        context,
                        '/Bank_Service',
                        '/Bank_Details',
                        Data(
                            bankName: User.data![indexs].bankName,
                            balanceNumber:
                                User.data![indexs].balanceNumber,
                            miniNumber: User.data![indexs].miniNumber,
                            careNumber: User.data![indexs].careNumber),

                        transition);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1.5,
                          color: Color.fromRGBO(98, 104, 208, 1)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: ScreenSize.pSize_50(),
                          width: ScreenSize.pSize_50(),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(98, 104, 208, 230),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1.5,
                              color: Color.fromRGBO(98, 104, 208, 1),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            User.data![indexs].bankName![index]
                                .toString(),
                            style: TextStyle(
                                fontSize: ScreenSize.pSize_45(),
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(98, 104, 208, 1),
                                shadows: [
                                  Shadow(
                                      color: Colors.black26,
                                      blurRadius: 7,
                                      offset: Offset(2, 3))
                                ]),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                              User.data![indexs].bankName.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'discrip',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Color.fromRGBO(98, 104, 208, 1),
                                  fontSize: ScreenSize.pSize_14())),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
            ),

          ),

          SizedBox(height: ScreenSize.pSize_50()),
        ],
      ),
    );
  }
}
