import 'package:auditorium/utils/animated_visibility.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

const cardColor = Color(0xff13162d);
const backgroundColor = Color(0xffcccccc);

class LightScreen extends StatefulWidget {
  const LightScreen({super.key});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen>
    with TickerProviderStateMixin {
  static bool visibility = true;

  late Color screenPickerColor; // Color for picker shown in Card on the screen.
  late Color dialogPickerColor; // Color for picker in dialog using onChanged
  late Color dialogSelectColor;

  late AnimationController controller;
  late Animation<double> animation;

  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  @override
  void initState() {
    screenPickerColor = Colors.blue;
    dialogPickerColor = const Color(0xffcccccc);
    dialogSelectColor = const Color(0xFFA239CA);
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1250), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  String changeLEDClr = 'Change LED Color';

  bool pressedButton = false;

  @override
  Widget build(BuildContext context) {
    // final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Lights',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15),
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
                          MaterialButton(
                            child: Container(
                              decoration: BoxDecoration(
                                color: dialogPickerColor,
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
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        changeLEDClr.toString(),
                                        style: pressedButton == false
                                            ? const TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold)
                                            : const TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.bold)
                                        // style: const TextStyle(
                                        //     fontWeight: FontWeight.bold),
                                        // textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*buildMaterialButton(
                                screenWidth: screenWidth,
                                label: 'Change LED Color',
                                onPressed: ()
                                async {
                                  debugPrint('pressed changeLEDColor');
                                  final Color colorBeforeDialog =
                                      dialogPickerColor;
                                  if (!(await colorPickerDialog())) {
                                    setState(() {
                                      dialogPickerColor = colorBeforeDialog;
                                    });
                                  }
                                },
                              ),*/
                            ),
                            onPressed: () async {
                              debugPrint('pressed changeLEDColor');
                              final Color colorBeforeDialog = dialogPickerColor;
                              if (!(await colorPickerDialog())) {
                                setState(() {
                                  pressedButton=!pressedButton;
                                  // changeLEDClr.toColor;
                                  dialogPickerColor = colorBeforeDialog;
                                });
                              }
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Walk Out',
                            onPressed: () {
                              debugPrint('pressed walkout');
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
                            label: 'Trailer',
                            onPressed: () {
                              debugPrint('pressed trailer');
                              setState(() {
                                // backgroundColor=createMaterialColor(Color(0xffa95757));
                                debugPrint('here inside color trailer');
                              });
                            },
                          ),
                          buildMaterialButton(
                            screenWidth: screenWidth,
                            label: 'Feature',
                            onPressed: () {
                              debugPrint('pressed feature');
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
          color: backgroundColor,
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

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select LED color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select LED color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Selected LED color and its shades',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: false,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(10),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }
}
