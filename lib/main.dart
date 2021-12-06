import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: CalculatorApp(),
    );
  }
}

const Color colorDark = Color(0xff374352);
const Color colorLight = Color(0xffe6eeff);

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  bool darkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                         setState(() {
                              darkMode ? darkMode = false : darkMode = true;
                         });
                          },
                          child: _switchMode()),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "2.750",
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "=",
                            style: TextStyle(
                              fontSize: 34,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          ),
                          Text(
                            "10+500x12",
                            style: TextStyle(
                              fontSize: 20,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonOval(title: "sin"),
                      _buttonOval(title: "cos"),
                      _buttonOval(title: "tan"),
                      _buttonOval(title: "%"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                          title: "C",
                          textColor: darkMode ? Colors.green : Colors.red),
                      _buttonRounded(title: "("),
                      _buttonRounded(title: ")"),
                      _buttonRounded(
                          title: "/",
                          textColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: "7"),
                      _buttonRounded(title: "8"),
                      _buttonRounded(title: "9"),
                      _buttonRounded(
                          title: "x",
                          textColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: "4"),
                      _buttonRounded(title: "5"),
                      _buttonRounded(title: "6"),
                      _buttonRounded(
                          title: "-",
                          textColor: darkMode ? Colors.green : Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: "1"),
                      _buttonRounded(title: "2"),
                      _buttonRounded(title: "3"),
                      _buttonRounded(
                          title: "+",
                          textColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: "0"),
                      _buttonRounded(title: ","),
                      _buttonRounded(
                          icon: Icons.backspace_outlined,
                          iconColor: darkMode ? Colors.green : Colors.red),
                      _buttonRounded(
                          title: "=",
                          textColor: darkMode ? Colors.green : Colors.red),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return CalculateButton(
      borderRadius: BorderRadius.circular(40),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      darkMode: darkMode,
      child: Container(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.red,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonOval({String title = "", double padding = 15}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CalculateButton(
          padding:
              EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
          darkMode: darkMode,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: padding * 2.5,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }

  Widget _buttonRounded({
    String? title,
    double padding = 20,
    IconData icon = Icons.ac_unit,
    Color iconColor = Colors.black,
    Color? textColor,
  }) {
    return CalculateButton(
      padding: EdgeInsets.all(padding),
      borderRadius: BorderRadius.circular(40),
      darkMode: darkMode,
      child: Container(
        width: padding * 2,
        height: padding * 2,
        child: Center(
          child: title != null
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    color: textColor == null
                        ? darkMode
                            ? Colors.white
                            : Colors.black
                        : textColor,
                  ),
                )
              : Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                ),
        ),
      ),
    );
  }
}

class CalculateButton extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CalculateButton(
      {Key? key,
      required this.darkMode,
      this.borderRadius,
      this.padding,
      required this.child})
      : super(key: key);

  @override
  _CalculateButtonState createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color:
                          darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15,
                      spreadRadius: 1,
                    )
                  ]),
        child: widget.child,
      ),
    );
  }
}
