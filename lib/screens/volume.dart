import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const cardColor = Color(0xff13162d);
const backgroundColor = Color(0xffcccccc);

class VolumeScreen extends StatefulWidget {
  const VolumeScreen({super.key});

  @override
  State<VolumeScreen> createState() => _VolumeScreenState();
}

class _VolumeScreenState extends State<VolumeScreen> with TickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;

  AudioStream _audioStream = AudioStream.music;
  AudioSessionCategory _audioSessionCategory = AudioSessionCategory.ambient;
  double _currentVolume = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1250), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    //vol ctrlr
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Platform.isIOS) {
        await _loadIOSAudioSessionCategory();
      }
      if (Platform.isAndroid) {
        await _loadAndroidAudioStream();
      }
    });
    FlutterVolumeController.addListener((volume) {
      setState(() {
        _currentVolume = volume;
      });
    });
  }

  @override
  void dispose() {
    FlutterVolumeController.removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = 50;

    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    /*return Scaffold(
      appBar: AppBar(
        title:  const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Volume',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 15),
          ),
        ),
        backgroundColor: cardColor,
      ),
      body:SizedBox(
        height: screenHeight * 0.3,
        child:
        Padding(
          padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
          child: Column(
            children: [
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,top: 8.0,left: 8.0,right: 8.0),
                  child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    // blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth*0.42,
                              height: 100,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Walk In',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onPressed: (){
                              debugPrint('pressed walkin');
                            },
                          ),
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    // blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth*0.42,
                              height: 100,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Walk Out',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onPressed: (){
                              debugPrint('pressed walk out');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    // blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth*0.42,
                              height: 100,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Trailer',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onPressed: (){
                              debugPrint('pressed trailer');
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    // blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth*0.42,
                              height: 100,
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Feature',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onPressed: (){
                              debugPrint('pressed feature');
                            },
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Volume',
            textAlign: TextAlign.center,
            style: TextStyle(color:Colors.white,fontSize: 15),
          ),
        ),
        backgroundColor: cardColor, // Use your desired color
      ),
      body: FadeTransition(
        opacity: animation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Mute',
                            onPressed: () {
                              debugPrint('pressed mute');
                            },
                          ),*/
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth * 0.4,
                              height: 80,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('Mute',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onPressed: ()
                            {
                              debugPrint('pressed mute');
                              setState(() {
                                FlutterVolumeController.setMute(
                                  true,
                                  stream: _audioStream,
                                );
                              });
                            },
                          ),
                          /*buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Vol -',
                            onPressed: () {
                              debugPrint('pressed vol -');
                            },
                          ),*/
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth * 0.4,
                              height: 80,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('Volume Down',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onPressed: ()
                             {
                               debugPrint('pressed down ');
                               setState(() {
                                 FlutterVolumeController.lowerVolume(
                                   0.2,
                                   stream: _audioStream,
                                 );
                               });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Unmute',
                            onPressed: () {
                              debugPrint('pressed ummute');
                            },
                          ),*/
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth * 0.4,
                              height: 80,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('UnMute',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onPressed: ()
                            {
                              debugPrint('pressed unmute');
                              setState(() {
                                FlutterVolumeController.setMute(
                                  false,
                                  stream: _audioStream,
                                );
                              });
                            },
                          ),
                          /*buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Vol +',
                            onPressed: () {
                              debugPrint('pressed vol +');
                            },
                          ),*/
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: screenWidth * 0.4,
                              height: 80,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('Volume up',
                                          style: TextStyle(fontWeight: FontWeight.bold)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onPressed: ()
                            {
                              debugPrint('pressed up ');
                              setState(() {
                                FlutterVolumeController.raiseVolume(
                                  0.2,
                                  stream: _audioStream,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.3,
                            width: screenWidth * 0.3,
                            child: SfRadialGauge(
                              axes: [
                                RadialAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 270,
                                  endAngle: 270,
                                  axisLineStyle: const AxisLineStyle(
                                    thickness: 1,
                                    color: Color(0xff13162d),
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: progressValue,
                                        width: 0.1,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        cornerStyle: CornerStyle.startCurve,
                                        gradient: const SweepGradient(colors: <Color>[
                                          Color(0xff1b1e4b),
                                          Color(0xff64678d)
                                        ], stops: <double>[
                                          0.25,
                                          0.75
                                        ])),
                                    MarkerPointer(
                                      value: progressValue,
                                      markerType: MarkerType.circle,
                                      color: Colors.white,
                                      enableAnimation: true,
                                    ),
                                  ],
                                  annotations: [
                                    GaugeAnnotation(
                                        positionFactor: 0.1,
                                        angle: 90,
                                        widget: Text(
                                          '${progressValue.toStringAsFixed(0)} / 100',
                                          style: const TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ))
                                  ],
                                  onAxisTapped: (double value){
                                    setState(() {
                                      progressValue=value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMaterialButton({
    required double screenWidth,
    required String label,
    required VoidCallback onPressed,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color:backgroundColor, // Use your desired color
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // offset: const Offset(0, 3),
            ),
          ],
        ),
        width: screenWidth * 0.4,
        height: 80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<AudioStream?> _pickAndroidAudioStream(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: AudioStream.values.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(AudioStream.values[index].name),
              onTap: () {
                Navigator.of(context).maybePop(AudioStream.values[index]);
              },
            );
          },
        );
      },
    );
  }

  Future<AudioSessionCategory?> _pickIOSAudioSessionCategory(
      BuildContext context,
      ) async {
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: AudioSessionCategory.values.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(AudioSessionCategory.values[index].name),
              onTap: () {
                Navigator.of(context).maybePop(
                  AudioSessionCategory.values[index],
                );
              },
            );
          },
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _loadIOSAudioSessionCategory() async {
    final category = await FlutterVolumeController.getIOSAudioSessionCategory();
    if (category != null) {
      setState(() {
        _audioSessionCategory = category;
      });
    }
  }

  Future<void> _loadAndroidAudioStream() async {
    final audioStream = await FlutterVolumeController.getAndroidAudioStream();
    if (audioStream != null) {
      setState(() {
        _audioStream = _audioStream;
      });
    }
  }
}

