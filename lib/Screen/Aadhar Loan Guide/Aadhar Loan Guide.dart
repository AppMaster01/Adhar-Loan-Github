import 'package:adhar_loan/All_Typs_Ads/Google_Ads/Ads.dart';
import 'package:adhar_loan/Media_Qury/Media_Qury.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Controller/butoon_controller/mainn_Controllr.dart';
import '../../Global_Data/global.dart';

class Aadhar_Loan_Guide extends StatelessWidget {
  Aadhar_Loan_Guide({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 3,
      title: Column(
        children: [
          SizedBox(height: ScreenSize.pSize_10()),
          const Center(
            child: Text(
              'Exit App ',
              style: TextStyle(
                  fontSize: 22, color: Colors.black, fontFamily: 'text'),
            ),
          ),
          SizedBox(height: ScreenSize.pSize_20()),
          Text(
            """Are you sure you want to 
                    Quite ?""",
            style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w400,
                fontFamily: 'rohan'),
          ),
        ],
      ),
      // content: const
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(248, 248, 255, 1),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minimumSize: Size(90, 40), //////// HERE
              ),
              onPressed: () => SystemNavigator.pop(),
              child: const Text(
                'Yes',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'rohan'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(98, 104, 208, 1),
                shadowColor: Colors.black,

                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minimumSize: Size(90, 40), //////// HERE
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'No',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'rohan'),
              ),
            ),
          ],
        ),
        SizedBox(height: ScreenSize.pSize_20(), width: ScreenSize.pSize_80()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color.fromRGBO(98, 104, 208, 1),
              title: Text('Aadhar Loan Guide',
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
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, "/Adhar_guide", '/Aadhar_Loan_Guide','',transition);
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/aadhar-loan-guide-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Aadhar Loan',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Guide',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: ScreenSize.pSize_15()),
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => Loan_Types());
                                tapController.tapbutton(
                                    context, '/Loan_Types', '/Aadhar_Loan_Guide','',transition);
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/loan-types-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Types of',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Aadhar Loan',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.pSize_10()),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, '/Address_Change', '/Aadhar_Loan_Guide','',transition);
                                // Get.to(() => Address_Change());
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/address-change-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Address',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Changes',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: ScreenSize.pSize_15()),
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, '/EPF_Service', '/Aadhar_Loan_Guide','',transition);
                                // Get.to(() => EPF_Service());
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/EPF-service-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('EPF',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Service',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.pSize_10()),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, '/Adhar_Pan_Link', '/Aadhar_Loan_Guide','',transition);
                                // Get.to(() => Adhar_Pan_Link());
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/aadhar-pan-link-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Aadhar Pan',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Link',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: ScreenSize.pSize_15()),
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, '/Bank_Details',  '/Aadhar_Loan_Guide','',transition);
                                // Get.to(() => Bank_Details());
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/bank-info-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Bank ',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Info',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenSize.pSize_10()),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, '/Bank_Holiday', '/Aadhar_Loan_Guide', '',transition);
                                // Get.to(() => Bank_Holiday());
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/bank-holiday-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Bank',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Holiday',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: ScreenSize.pSize_15()),
                            GestureDetector(
                              onTap: () {
                                tapController.tapbutton(
                                    context, '/Near_By_Me', '/Aadhar_Loan_Guide','', transition);
                                // Get.to(() => Near_By_Me());
                              },
                              child: Container(
                                width: ScreenSize.pSize_150(),
                                height: ScreenSize.pSize_140(),
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
                                        height: ScreenSize.pSize_40(),
                                        image: AssetImage(
                                            'asset/image/near-by-me-icon.png')),
                                    SizedBox(height: ScreenSize.pSize_11()),
                                    Text('Near By',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                    Text('Me',
                                        style: TextStyle(
                                            fontSize: ScreenSize.pSize_18(),
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                98, 104, 208, 1))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.pSize_80(),
                        )
                      ],
                    ),
                  ),
                ),
                banner.BANNER('/Aadhar_Loan_Guide'),
              ],
            )));
  }
}
