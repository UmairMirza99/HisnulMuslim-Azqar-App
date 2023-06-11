import 'package:azqar_task/Data/DataOf.dart';
import 'package:azqar_task/Screens/listPage.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

String Category_Name = 'HISNULMUSLIM';

class home_Page extends StatefulWidget {
  const home_Page({Key? key}) : super(key: key);

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        '$Category_Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/hisnulmuslim.webp'),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: _topHeadingView()),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CategoryBox(
                          Text_1: 'ILLNESS',
                          Text_2: 'DAILY LIFE',
                          image_1: 'assets/ILLNESS.jpg',
                          image_2: 'assets/daily_life.jpg'),
                      CategoryBox(
                          Text_1: 'TRAVEL',
                          Text_2: 'MORNING OR EVENING',
                          image_1: 'assets/TRAVEL.jpg',
                          image_2: 'assets/MORNING.jpg'),
                      CategoryBox(
                          Text_1: 'PRAYER',
                          Text_2: 'WELLBEING',
                          image_1: 'assets/PRAYER.jpg',
                          image_2: 'assets/WELLBEING.jpg'),
                      CategoryBox(
                          Text_1: 'TRIALS',
                          Text_2: 'HAJJ/ UMRAH',
                          image_1: 'assets/TRIAL.jpg',
                          image_2: 'assets/khanakaba.jpg'),
                      CategoryBox(
                          Text_1: 'QUR\'ANIC DUAS',
                          Text_2: 'AZKAR',
                          image_1: 'assets/QURAN_MAJEED.jpg',
                          image_2: 'assets/azkar.jpg'),
                      SizedBox(
                        width: 50,
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CategoryBox(
      {required String Text_1,
      required String Text_2,
      required String image_1,
      required String image_2}) {
    return Container(
        height: MediaQuery.of(context).size.width < 400 ? 200 : 150,
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    if (Text_1 == 'ILLNESS') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_1',
                                    Data: Illness_List,
                                  )));
                    }
                    if (Text_1 == 'TRAVEL') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_1',
                                    Data: Travel_List,
                                  )));
                    }
                    if (Text_1 == 'PRAYER') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_1',
                                    Data: Prayers_List,
                                  )));
                    }
                    if (Text_1 == 'TRIALS') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_1',
                                    Data: Trials_list,
                                  )));
                    }
                    if (Text_1 == 'QUR\'ANIC DUAS') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_1',
                                    Data: Quran_List,
                                  )));
                    }
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(right: 5, left: 5, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('$image_1'), fit: BoxFit.cover)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      margin: EdgeInsets.only(bottom: 3, left: 1.5, right: 1.5),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Text(
                        '$Text_1',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    if (Text_2 == 'DAILY LIFE') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_2',
                                    Data: DailyLife_list,
                                  )));
                    }
                    if (Text_2 == 'MORNING OR EVENING') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_2',
                                    Data: Morning_list,
                                  )));
                    }
                    if (Text_2 == 'WELLBEING') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_2',
                                    Data: Wellbeing_list,
                                  )));
                    }
                    if (Text_2 == 'HAJJ/ UMRAH') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_2',
                                    Data: Hajj_List,
                                  )));
                    }
                    if (Text_2 == 'AZKAR') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    PageName: '$Text_2',
                                    Data: Azkar_List,
                                  )));
                    }
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('$image_2'), fit: BoxFit.cover)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      margin: EdgeInsets.only(bottom: 3, left: 1.5, right: 1.5),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Text(
                        '$Text_2',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget _topHeadingView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: const BoxDecoration(
        color: lightMehroonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('assets/flover_left_white.png')),
          Container(
            height: 30,
            width: 40,
            child: Icon(
              Icons.ac_unit_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(image: AssetImage('assets/surahNameBackground.png')),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 20,
                  child: Text(
                    'HISNULMUSLIM',
                    style: const TextStyle(
                      color: pureWhiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 40,
            child: Icon(
              Icons.ac_unit_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          Image(image: AssetImage('assets/flower_right_white.png'))
        ],
      ),
    );
  }
}
