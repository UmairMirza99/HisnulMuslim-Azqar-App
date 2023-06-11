// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, no_logic_in_create_state, file_names

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/DataOf.dart';
import '../Data/Object.dart';
import '../Dialog.dart';
import '../Firebase/FirebaseDataBaseServices.dart';
import '../Global.dart';
import '../colors.dart';

class Adapetr_second_screen extends StatefulWidget {
  Adapetr_second_screen(
      {Key? key,
      required this.Name,
      required this.StatusBarName,
      required this.indexxx,
      required this.lists_of_Data})
      : super(key: key) {
    // TODO: implement Adapetr_second_screen
  }
  String StatusBarName;
  String Name;
  int indexxx;

  List<Main_Object> lists_of_Data = [];
  @override
  State<Adapetr_second_screen> createState() =>
      _Adapetr_second_screenState(Name, StatusBarName, indexxx, lists_of_Data);
}

class _Adapetr_second_screenState extends State<Adapetr_second_screen> {
  String Name;
  PlayerState? _playerState;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;
  bool get isComplete => _playerState == PlayerState.completed;
  bool get isStopped => _playerState == PlayerState.stopped;
  AudioPlayer audio_player = AudioPlayer();
  Duration? _duration;
  int global_Index = 0;
  Duration? _position;
  String StatusBarName;
  int indexxx;
  FirebaseDatabaseService firebaseDatabaseService = FirebaseDatabaseService();
  //
  // String Duas = '';
  // String English_Duas = '';
  // String turjmas = '';
  // String Audios = '';
  // String Translate_Urdus = '';
  // int? indexss = 0;

  bool next = false;

  List<Main_Object> lists_of_Data = [];
  List<duaitems> Data = [];
  // double value_ = 0;
  bool check = false;
  _Adapetr_second_screenState(
      this.Name, this.StatusBarName, this.indexxx, this.lists_of_Data);
  IconData icons = Icons.play_arrow;
  Future<void> update_Data() async {
    setState(() {
      if (lists_of_Data[indexxx].azkar_11 != null) {
        List<String>? list = lists_of_Data[indexxx].azkar_11?.split(',');
        if (list != null) {
          for (int i = 0; i < list.length; i++) {
            for (var element in Duaitems_List) {
              if (element.id.toString() == list[i] &&
                  element.arabic != 'null') {
                Data.add(element);
              }
            }
          }
        }
      }
    });
  }

  // bool playing = false;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    update_Data();
    _playerState = audio_player.state;
    audio_player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    audio_player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
    // AudioPlayer player = new AudioPlayer();
    firebaseDatabaseService.Get_Current_Traffic(Key: 'Adapetr_second_screen');
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      audio_player.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            appBarView(label: '$StatusBarName', function: Go_Back),
            _topHeadingView(),
            Expanded(
              child: ListView.builder(
                itemCount: Data.length,
                itemBuilder: (context, index) {
                  return Adapter(
                      '${Data[index].arabic}',
                      '${Data[index].transliteration}',
                      '${Data[index].trans_en}',
                      '${Data[index].audio}',
                      '${Data[index].trans_ur}',
                      index);
                },
              ),
            ),

            // Adapter('${Data[index].arabic}', '${Data[index].bottom_en}')
          ],
        ),
      ),
    ));
  }

  int selectedIndex = 0;
  Widget Adapter(String Dua, String English_Dua, String turjma, String Audio,
      String Translate_Urdu, int index) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            alignment: Alignment.center,
            child: Dua != 'null'
                ? Text(
                    '$Duaُ',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: darkMehroonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
                : Text(
                    '${Data[index].top_en}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: darkMehroonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
          ),
        ),
        English_Dua != 'null'
            ? Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  '"$English_Dua"',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )
            : SizedBox(),
        Dua != 'null'
            ? Container(
                width: (check && selectedIndex == index)
                    ? MediaQuery.of(context).size.width / 1.2
                    : (_isPaused && selectedIndex == index)
                        ? MediaQuery.of(context).size.width / 1.2
                        : 100,
                height: 40,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: lightMehroonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: InkWell(
                          onTap: () {
                            String url =
                                'https://pmmlgrw.com/al-quran/hisnul-muslim/$Audio.mp3';
                            _isPlaying
                                ? audio_player.pause()
                                : {
                                    audio_player.play(UrlSource(url)),
                                    setState(() {
                                      selectedIndex = index;
                                      check = true;
                                    })
                                  };
                          },
                          child: check &&
                                  _position?.inMilliseconds == 0.0 &&
                                  selectedIndex == index &&
                                  isComplete == false
                              ? const Image(
                                  image: AssetImage('assets/loading.gif'))
                              : Icon(
                                  (_isPlaying && selectedIndex == index)
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                )
                          // color: Colors.white,
                          ),
                    ),
                    (check && selectedIndex == index)
                        ? Slider_()
                        : const SizedBox(),
                    kIsWeb
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog_Box(
                                      Dua: Dua,
                                      English: English_Dua,
                                      Translation: Translate_Urdu,
                                    );
                                  });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 7),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                          )
                  ],
                ),
              )
            : const SizedBox(),
        Dua != 'null'
            ? Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text(
                  'Translation',
                  style: TextStyle(fontSize: 20),
                ))
            : SizedBox(),
        turjma != 'null'
            ? Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 5, top: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  turjma,
                  style: GoogleFonts.abel(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              )
            : SizedBox(),
        Translate_Urdu != 'null'
            ? Container(
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Text(
                  Translate_Urdu,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.notoNastaliqUrdu(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              )
            : SizedBox(),
        const Divider(
          height: 2,
          thickness: 1,
        ),
      ],
    );
  }

  Widget Slider_() {
    return Slider(
      activeColor: pureWhiteColor,
      inactiveColor: grayColor,
      onChanged: (v) {
        final duration = _duration;
        if (duration == null) {
          return;
        }
        final position = v * duration.inMilliseconds;
        audio_player.seek(Duration(milliseconds: position.round()));
      },
      value: (_position != null &&
              _duration != null &&
              _position!.inMilliseconds > 0 &&
              _position!.inMilliseconds < _duration!.inMilliseconds)
          ? _position!.inMilliseconds / _duration!.inMilliseconds
          : 0.0,
    );
  }

  _initStreams() {
    _durationSubscription = audio_player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = audio_player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = audio_player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        audio_player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
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
          const Image(image: AssetImage('assets/flover_left_white.png')),
          InkWell(
            onTap: () {
              setState(() {
                if (indexxx != 0) {
                  print(lists_of_Data.length);
                  Data.clear();
                  indexxx = indexxx - 1;
                  update_Data();
                }
              });
            },
            child: const SizedBox(
              height: 30,
              width: 40,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/surahNameBackground.png')),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 20,
                  child: Text(
                    '${lists_of_Data[indexxx].Titel_2}',
                    style: const TextStyle(
                      color: pureWhiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (indexxx < lists_of_Data.length - 1) {
                  print(lists_of_Data.length);
                  Data.clear();
                  indexxx = indexxx + 1;
                  update_Data();
                }
              });
            },
            child: const SizedBox(
              height: 30,
              width: 40,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          const Image(image: AssetImage('assets/flower_right_white.png'))
        ],
      ),
    );
  }

  Go_Back() {
    Navigator.pop(context);
  }
}
