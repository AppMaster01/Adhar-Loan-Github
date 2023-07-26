import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Global_Data/global.dart';
import 'package:adhar_loan/Screen/EPF_Sevice/EPF_Details_page/Show_Detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../Media_Qury/Media_Qury.dart';
import 'model.dart';

class Near_By_Me extends StatelessWidget {
  Near_By_Me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return WillPopScope(
      onWillPop: () {
        backtapController.backtapbutton(
            context, '/Aadhar_Loan_Guide', '/Near_By_Me', transition);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(98, 104, 208, 1),
          title: Text('Near By Me',
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
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      launchMapsUrl(text[index]);
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
                              height: ScreenSize.pSize_40(),
                              image: AssetImage(icon[index])),
                          SizedBox(height: ScreenSize.pSize_11()),
                          Text(text[index],
                              style: TextStyle(
                                  fontFamily: 'text',
                                  fontSize: ScreenSize.pSize_16(),
                                  color: Color.fromRGBO(98, 104, 208, 1))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            banner.BANNER('/Near_By_Me'),
          ],
        ),
      ),
    );
  }

  launchMapsUrl(String lat) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat near me';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
