import 'package:azqar_task/Data/Object.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '2nd Adapter Pge.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key, required this.PageName, required this.Data})
      : super(key: key);
  String PageName;
  List<Main_Object> Data = [];
  @override
  State<ListPage> createState() => _ListPageState(this.PageName, this.Data);
}

class _ListPageState extends State<ListPage> {
  List<Main_Object> Data = [];
  String? PageName;
  List<int> counter = [];
  var ids = [];
  _ListPageState(this.PageName, this.Data);
  Future<void> update() async {
    for (int i = 0; i < Data.length; i++) {
      if (Data[i].azkar_11 != null) {
        List<String>? list = Data[i].azkar_11?.split(',');
        ids.add(list);
        if (list != null) {
          counter.add(list.length);
        }
      }
    }
  }

  @override
  void initState() {
    update();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Container(
            height: 45,
            color: Colors.white,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage(
                      'assets/back_arrow.png',
                    ),
                    height: 35,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    child: Text(
                      '$PageName',
                      style: TextStyle(
                          color: darkMehroonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          _topHeadingView(),
          Expanded(
            child: ListView.builder(
              itemCount: Data.length,
              itemBuilder: (context, index) {
                return listAdapter(
                    urdu_text: '${Data[index].urdu_4}',
                    english_text: '${Data[index].Titel_2}',
                    counter: '${counter[index]}',
                    index: index);
              },
            ),
          )
          // listAdapter(
          //     urdu_text: 'urdu_text',
          //     english_text: 'english_text',
          //     counter: 'counter')
        ],
      ),
    ));
  }

  Widget listAdapter(
      {required String urdu_text,
      required String english_text,
      required String counter,
      required int index}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Adapetr_second_screen(
                    Name: english_text,
                    StatusBarName: '$PageName',
                    indexxx: index,
                    lists_of_Data: Data,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            height: 85,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(
                      Icons.ac_unit_rounded,
                      color: darkMehroonColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '$english_text',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              '$urdu_text',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.notoNastaliqUrdu(
                                  color: darkMehroonColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 40,
                    width: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/numberBackground.png',
                        ),
                        Text(
                          '$counter',
                          style: const TextStyle(
                            color: lightMehroonColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 1,
          )
        ],
      ),
    );
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
                    '$PageName',
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
