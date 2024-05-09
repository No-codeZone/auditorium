import 'package:auditorium/icon_menu.dart';
import 'package:auditorium/screens/audotorium.dart';
import 'package:auditorium/screens/humidity.dart';
import 'package:auditorium/screens/lights.dart';
import 'package:auditorium/screens/playback_server.dart';
import 'package:auditorium/screens/projector.dart';
import 'package:auditorium/screens/volume.dart';
import 'package:flutter/material.dart';

const cardColor = Color(0xff13162d);
const backgroundColor = Color(0xfff3f3f3);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const LightScreen(),
    const VolumeScreen(),
    const HumidityScreen(),
    const ProjectorScreen(),
    const AuditoriumScreen(),
    const PlayBackServerScreen(),
  ];

  final List<AssetImage> iconImages=[
    AssetImage('assets/images/icon_loader.png'),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const LightScreen();

  static bool visibility=true;


  @override
  Widget build(BuildContext context) {
    // final heightScreen = MediaQuery.of(context).size.height;
    // final widthScreen = MediaQuery.of(context).size.width;
    /*return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar:
      SizedBox(
        height: heightScreen * 0.28,
        child: Center(
          child:
          Column(
            children: [
              Container(
                width: widthScreen,
                height: heightScreen * 0.3,
                decoration: const BoxDecoration(color: Color(0xffc0bfbf)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,top: 20.0),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
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
                              width: widthScreen*0.3,
                              height: 100,
                              child: const Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.light_mode,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Lights',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                currentScreen=const LightScreen();
                                currentTab=0;
                              });
                            },
                          ),
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
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
                              width: widthScreen*0.3,
                              height: 100,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.volume_up,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Volume',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                currentScreen=const VolumeScreen();
                                currentTab=1;
                              });
                            },
                          ),
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
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
                              width: widthScreen*0.3,
                              height: 100,
                              child: const Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.water_drop,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Humidity',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                currentScreen=const HumidityScreen();
                                currentTab=2;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: (){
                              setState(() {
                                currentScreen=const ProjectorScreen();
                                currentTab=3;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
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
                              width: widthScreen*0.3,
                              height: 100,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.connected_tv,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Projector',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: const BorderRadius.all(Radius.circular(360.0)),
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    // spreadRadius: 5,
                                    // blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: widthScreen*0.3,
                              height: 100,
                              child: const Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Auditorium',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                currentScreen=const AuditoriumScreen();
                                currentTab=4;
                              });
                            },
                          ),
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardColor,
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
                              width: widthScreen*0.3,
                              height: 100,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.stacked_bar_chart,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Playback Server',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onPressed: (){
                              setState(() {
                                currentScreen=const PlayBackServerScreen();
                                currentTab=5;
                              });
                            },
                          ),
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
    );*/
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          final widthScreen = constraints.maxWidth;
          final heightScreen = constraints.maxHeight;
          return Container(
            decoration: const BoxDecoration(
              color: backgroundColor
            ),
            child: SizedBox(
              height: heightScreen * 0.3,
              width: widthScreen,
              child: Center(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildMaterialButton(
                            width: widthScreen,
                            icon: Icons.light_mode,
                            // image: const AssetImage('assets/images/icon_loader.png'),
                            // image: IconImages.iconLight,
                            label: 'Lights',
                            onPressed: () {
                              setState(() {
                                // if(AnimatedVisibility.buttonPressed!=true){
                                  currentScreen = const LightScreen();
                                  currentTab = 0;
                                // }
                              });
                            },
                          ),
                          buildMaterialButton(
                            width: widthScreen,
                            icon: Icons.volume_up,
                            // image: IconImages.iconVolume,
                            label: 'Volume',
                            onPressed: () {
                              setState(() {
                                currentScreen = const VolumeScreen();
                                currentTab = 1;
                              });
                            },
                          ),
                          buildMaterialButton(
                            width: widthScreen,
                            icon: Icons.water_drop,
                            // image: IconImages.iconHumidity,
                            label: 'Humidity',
                            onPressed: () {
                              setState(() {
                                currentScreen = const HumidityScreen();
                                currentTab = 2;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildMaterialButton(
                            width: widthScreen,
                            icon: Icons.connected_tv,
                            // image: IconImages.iconProjector,
                            label: 'Projector',
                            onPressed: () {
                              setState(() {
                                currentScreen = const ProjectorScreen();
                                currentTab = 3;
                              });
                            },
                          ),
                        MaterialButton(
                          child: Container(
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: const BorderRadius.all(Radius.circular(360.0)),
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  // spreadRadius: 5,
                                  // blurRadius: 7,
                                  // offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            width: 80,
                            height: 80,
                            child: const Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Auditorium',
                                    style: TextStyle(color: Colors.white,fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                              currentScreen=const AuditoriumScreen();
                              currentTab=4;
                            });
                          },
                        ),
                          buildMaterialButton(
                            width: widthScreen,
                            icon: Icons.stacked_bar_chart,
                            // image: IconImages.iconPlayBackServer,
                            label: 'Playback Server',
                            onPressed: () {
                              setState(() {
                                currentScreen = const PlayBackServerScreen();
                                currentTab = 5;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMaterialButton({
    required double width,
    required IconData icon,
    // required Image image,
    required String label,
    required VoidCallback onPressed,
  }) {
     List<IconImages> iconImage = <IconImages>[
       IconImages(IconImages.iconLight),
       IconImages(IconImages.iconVolume),
       IconImages(IconImages.iconHumidity),
       IconImages(IconImages.iconProjector),
       IconImages(IconImages.iconPlayBackServer)
    ];
     selectIcon(int i){
       for(i=0;i<iconImage.length;i++){
         debugPrint('Image\t${i.toString()}');
       }
     }
     int index=0;
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // offset: const Offset(0, 3),
            ),
          ],
        ),
        width: width * 0.244,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 45,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                // Image.asset('${selectIcon(index)}',color: Colors.white,width: 45,height: 45,),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white,fontSize: 10),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
