import 'package:flutter/material.dart';

const cardColor = Color(0xff13162d);
const backgroundColor = Color(0xffcccccc);

class AuditoriumScreen extends StatefulWidget {
  const AuditoriumScreen({super.key});

  @override
  State<AuditoriumScreen> createState() => _AuditoriumScreenState();
}

class _AuditoriumScreenState extends State<AuditoriumScreen> with TickerProviderStateMixin{
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
            'Auditorium',
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
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label1: '1',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector1');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label1: '2',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector2');
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
                            label1: '3',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector3');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label1: '4',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector4');
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
                            label1: '5',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector5');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label1: '6',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector6');
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
                            label1: '7',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector7');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label1: '8',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector8');
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
                            label1: '9',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector9');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label1: '10',
                            label2: 'Projector',
                            onPressed: () {
                              debugPrint('pressed Projector10');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
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
    required String label1,
    required String label2,
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
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label1,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                ),
                Text(
                  label2,
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
