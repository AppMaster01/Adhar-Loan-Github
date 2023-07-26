import 'package:adhar_loan/Controller/butoon_controller/mainn_Controllr.dart';
import 'package:adhar_loan/Controller/text_.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../All_Typs_Ads/Google_Ads/Ads.dart';
import '../../../Global_Data/global.dart';
import '../../../Media_Qury/Media_Qury.dart';
import '../../Addres_Change/first/Addres_Change.dart';

class Bank_Holiday extends StatefulWidget {
  const Bank_Holiday({Key? key}) : super(key: key);

  @override
  State<Bank_Holiday> createState() => _Bank_HolidayState();
}

class _Bank_HolidayState extends State<Bank_Holiday> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "Andaman & Nicobar"},
    {"name": "Bihar"},
    {"name": "Dadra & Nagar Haveli"},
    {"name": "Gujarat"},
    {"name": "Andhar Pradesh"},
    {"name": "Chandigarh"},
    {"name": "Puducherry"},
    {"name": "west Bengal"},
    {"name": "Tripura"},
    {"name": "Himachal Pradesh"},
    {"name": "Rajasthan"},
    {"name": "Asam"},
    {"name": "New Delhi"},
    {"name": "Panjab"},
    {"name": "Jharkhand"},
    {"name": "Uttar Pradesh"},
    {"name": "Karnataka"},
    {"name": "Nagaland"},
    {"name": "Goa"},
    {"name": "Uttarakhand"},
    {"name": "Daman & Diu"},
    {"name": "Maharashtra"},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: WillPopScope(
        onWillPop: () {
          backtapController.backtapbutton(
              context, '/Aadhar_Loan_Guide', '/Bank_Holiday', transition);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(98, 104, 208, 1),
            title: Text('Bank Holiday',
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: ScreenSize.pSize_45(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color.fromRGBO(246, 246, 246, 1),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.5, 1.2),
                                  color: Colors.black26,
                                  blurRadius: 1)
                            ]),
                        child: TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search_rounded,
                                  color: Colors.black54),
                              hintText: "Serch",
                              filled: true,
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide())),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _foundUsers.isNotEmpty
                          ? ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              tapController.tapbutton(context,
                                  '/Bank_holiday_Detail', '/Bank_Holiday', '',
                                  transition);

                              // controller.showbuttonad(context, '/Bank_holiday_Detail', 'aa');
                              // Get.to(() => Bank_holiday_Detail());
                            },
                            child: Container(
                              height: ScreenSize.pSize_55(),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color.fromRGBO(248, 248, 255, 1),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 1.8),
                                        color: Colors.black26,
                                        blurRadius: 1.5)
                                  ]),
                              child: Row(
                                children: [
                                  controllertext.Showtext(context,
                                      _foundUsers[index]['name']),
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
                                    color:
                                    Color.fromRGBO(248, 248, 255, 1),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(1, 3),
                                          color: Colors.black26,
                                          blurRadius: 3)
                                    ]),
                                child: (index + 1) % 11 == 0
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
                      )
                          : const Text(
                        'No results found Please try with diffrent search',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: ScreenSize.pSize_60()),
                    ],
                  ),
                ),
              ),
              banner.BANNER('/Bank_Holiday'),
            ],
          ),
        ),
      ),
    );
  }
}
