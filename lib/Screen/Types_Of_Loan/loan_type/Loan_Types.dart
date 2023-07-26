import 'package:adhar_loan/Global_Data/global.dart';
import 'package:flutter/material.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../Media_Qury/Media_Qury.dart';
import 'loan_typs_model.dart';

class Loan_Types extends StatelessWidget {
  Loan_Types({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Aadhar_Loan_Guide', '/Loan_Types', transition);
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
              'Loan Type',
              style: TextStyle(fontSize: ScreenSize.pSize_20()),
            )),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                itemCount: Loan_descrip.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      tapController.tapbutton(context, "/Loan_details",'/Loan_Types',
                          Loan_List[index],transition);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 1.2,
                            color: Color.fromRGBO(98, 104, 208, 1)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: ScreenSize.pSize_45(),
                              image: AssetImage(Loan_image[index])),
                          SizedBox(height: ScreenSize.pSize_15()),
                          Text(Loan_Text[index],
                              style: TextStyle(
                                  fontFamily: 'discrip',
                                  fontSize: ScreenSize.pSize_18(),
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(98, 104, 208, 1))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            banner.BANNER('/Loan_Types'),
          ],
        ),
      ),
    );
  }
}
