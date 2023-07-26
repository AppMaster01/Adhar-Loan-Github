// ignore_for_file: non_constant_identifier_names

import 'package:adhar_loan/Screen/Types_Of_Loan/loan_type_details/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../Global_Data/global.dart';
import '../../../Media_Qury/Media_Qury.dart';
import '../loan_type/loan_typs_model.dart';

// int index = 0;

class Loan_details extends StatelessWidget {
  Loan_details({Key? key}) : super(key: key);

Type_loan type_loan = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(context, '/Loan_Types', '/Loan_details', transition);
        return Future.value(false);
      },

      child: Scaffold(
        appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
            backgroundColor: Color.fromRGBO(98, 104, 208, 25),
            centerTitle: true,
            title: Text(
              'Detail',
              style: TextStyle(fontSize: ScreenSize.pSize_20()),
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.pSize_10()),
                  native.getNT("/Loan_details"),
                  SizedBox(height: ScreenSize.pSize_20()),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(248, 248, 255, 1),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 4),
                                color: Colors.black26,
                                blurRadius: 2)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          type_loan.Loan_descrip,
                          style: TextStyle(
                            fontFamily: 'rohan',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.pSize_80()),
                ],
              ),
            ),
            banner.BANNER('/Loan_details'),
          ],
        ),
      ),
    );
  }
}
