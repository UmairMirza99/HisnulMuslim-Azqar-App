import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

import 'colors.dart';

class Dialog_Box extends StatefulWidget {
  Dialog_Box(
      {Key? key,
      required this.Dua,
      required this.English,
      required this.Translation})
      : super(key: key);
  String Dua;
  String English;
  String Translation;
  @override
  State<Dialog_Box> createState() =>
      _Dialog_BoxState(this.Dua, this.English, this.Translation);
}

class _Dialog_BoxState extends State<Dialog_Box> {
  String? Dua;
  bool Add_In_English = false;
  bool Add_In_Urdu = false;
  String? English;
  String? Translation;
  _Dialog_BoxState(this.Dua, this.English, this.Translation);

  double widths = 500;
  double Height = 200;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        actions: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: AnimatedContainer(
                        duration: Duration(microseconds: 900),
                        // Add_In_English ? MediaQuery.of(context).size.height : Height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 10, right: 20),
                              child: Container(
                                decoration: BoxDecoration(border: Border.all()),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        '$Dua',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: darkMehroonColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Add_In_English
                                        ? Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text(
                                              '"$English"',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          )
                                        : SizedBox(),
                                    Add_In_Urdu
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: Text(
                                              '$Translation',
                                              textAlign: TextAlign.right,
                                              style:
                                                  GoogleFonts.notoNastaliqUrdu(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lightMehroonColor,
                                                      fontSize: 13),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: Add_In_English,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              Add_In_English = value!;
                                            });
                                          }),
                                      Text('Add English')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: Add_In_Urdu,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              Add_In_Urdu = value!;
                                            });
                                          }),
                                      Text(
                                        'Add Urdu Translation',
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    String? Duas = Dua;
                                    String English_Transalation = '';
                                    String Urdu_Translation = '';
                                    if (Add_In_English != false) {
                                      setState(() {
                                        English_Transalation = '$English';
                                      });
                                    }
                                    if (Add_In_Urdu != false) {
                                      setState(() {
                                        Urdu_Translation = '$Translation';
                                      });
                                    }
                                    setState(() {
                                      Share.share(
                                          'Today Pray \n Pray: $Duas \n\n $English_Transalation \n \n $Urdu_Translation');
                                    });
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    size: 15,
                                  ),
                                  label: Text('Share')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
