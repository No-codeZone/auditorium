import 'package:flutter/material.dart';

const cardColor = Color(0xff13162d);
const backgroundColor = Color(0xffcccccc);

class HumidityScreen extends StatefulWidget {
  const HumidityScreen({super.key});

  @override
  State<HumidityScreen> createState() => _HumidityScreenState();
}

class _HumidityScreenState extends State<HumidityScreen> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1250), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Humidity',
            textAlign: TextAlign.center,
            style: TextStyle(color:Colors.white,fontSize: 15),
          ),
        ),
        backgroundColor: cardColor, // Use your desired color
      ),
      body: FadeTransition(
        opacity: animation,
        child: SingleChildScrollView(
          child:
          Column(
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
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Masking Flat',
                            onPressed: () {
                              debugPrint('pressed masking flat');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Humidity Sensor',
                            onPressed: () {
                              debugPrint('pressed sensor humidity');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Controller Thermostat',
                            onPressed: () {
                              debugPrint('pressed thermostat controller');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Alexa',
                            onPressed: () {
                              debugPrint('pressed Alexa');
                            },
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
        child: Padding(
          padding: const EdgeInsets.all(3.0),
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
      ),
    );
  }
}
