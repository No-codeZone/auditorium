import 'package:flutter/material.dart';

const cardColor = Color(0xff13162d);
const backgroundColor = Color(0xffcccccc);

class ProjectorScreen extends StatefulWidget {
  const ProjectorScreen({super.key});

  @override
  State<ProjectorScreen> createState() => _ProjectorScreenState();
}

class _ProjectorScreenState extends State<ProjectorScreen> with TickerProviderStateMixin{
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
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Projector',
            textAlign: TextAlign.center,
            style: TextStyle(color:Colors.white,fontSize: 15),
          ),
        ),
        backgroundColor: cardColor,
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
                            label: 'Smart Projector Control',
                            onPressed: () {
                              debugPrint('pressed masking smartCtrl Projector');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Wifi',
                            onPressed: () {
                              debugPrint('pressed wifi');
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
                            label: 'Youtube/Netflix',
                            onPressed: () {
                              debugPrint('pressed Youtube/Netflix');
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Settings',
                            onPressed: () {
                              debugPrint('pressed Settings');
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
          color:backgroundColor,
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
}
