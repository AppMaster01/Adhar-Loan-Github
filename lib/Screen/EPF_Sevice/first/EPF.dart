import 'package:flutter/material.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../../Global_Data/global.dart';
import '../../../Media_Qury/Media_Qury.dart';
import 'EFP_Modl.dart';
import '../EPF_Details_page/Details_Model/Claim/model.dart';

class EPF_Service extends StatelessWidget {
  EPF_Service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Aadhar_Loan_Guide', '/EPF_Service', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          title: Text('EPF Service',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: Epf_image.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      tapController.tapbutton(context, '/Show_Details',
                          '/EPF_Service', Epf_Detail_List[index], transition);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 1.2, color: Color.fromRGBO(98, 104, 208, 1)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: ScreenSize.pSize_30(),
                              image: AssetImage(Epf_image[index])),
                          SizedBox(height: ScreenSize.pSize_11()),
                          Text(Epf_Text[index],
                              style: TextStyle(
                                  fontFamily: 'Text',
                                  fontSize: ScreenSize.pSize_16(),
                                  // fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(98, 104, 208, 1))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            banner.BANNER('/EPF_Service'),
          ],
        ),
      ),
    );
  }
}
