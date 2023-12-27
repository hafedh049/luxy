import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/button.dart';
import 'package:luxy/views/auth/password.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPPrompt extends StatefulWidget {
  const OTPPrompt({super.key});

  @override
  State<OTPPrompt> createState() => _OTPPromptState();
}

class _OTPPromptState extends State<OTPPrompt> {
  final GlobalKey<State> _buttonKey = GlobalKey<State>();
  final GlobalKey<State> _tiktokKey = GlobalKey<State>();

  final OtpFieldController _otpController = OtpFieldController();

  late final Timer _timer;

  int _fillIndex = 0;
  int _tiktok = 60;
  String _pin = "";

  final Map<IconData, String> _keyboard = <IconData, String>{
    FontAwesome.num1_solid: "1",
    FontAwesome.num2_solid: "2",
    FontAwesome.num3_solid: "3",
    FontAwesome.num4_solid: "4",
    FontAwesome.num5_solid: "5",
    FontAwesome.num6_solid: "6",
    FontAwesome.num7_solid: "7",
    FontAwesome.num8_solid: "8",
    FontAwesome.num9_solid: "9",
    FontAwesome.asterisk_solid: "*",
    FontAwesome.num0_solid: "0",
    FontAwesome.x_solid: "x",
  };

  @override
  void initState() {
    _timer = Timer.periodic(
      1.seconds,
      (Timer timer) {
        if (_tiktok > 0) {
          _tiktokKey.currentState!.setState(() => _tiktok -= 1);
        } else {
          _timer.cancel();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
        title: const Text("Forgot Password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        onClosing: () {},
        builder: (BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(margin: const EdgeInsets.symmetric(vertical: 8), width: 80, height: 3, decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(5))),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 10,
              spacing: 10,
              children: <Widget>[
                for (int icon = 0; icon < _keyboard.keys.length; icon += 1)
                  SizedBox(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width / 4,
                    child: Buttoned(
                      icon: _keyboard.keys.elementAt(icon),
                      text: "",
                      callback: () {
                        if (_keyboard.keys.elementAt(icon) != FontAwesome.asterisk_solid) {
                          if (_keyboard.keys.elementAt(icon) != FontAwesome.x_solid) {
                            if (_fillIndex < 4) {
                              _otpController.setValue(_keyboard[_keyboard.keys.elementAt(icon)]!, _fillIndex);
                              _fillIndex += 1;
                            }
                          } else {
                            if (_fillIndex > 0) {
                              _fillIndex -= 1;
                              _otpController.setValue("", _fillIndex);
                            }
                          }
                        }
                      },
                    ),
                  ),
              ],
            ),
            Container(margin: const EdgeInsets.symmetric(vertical: 8), width: 80, height: 3, decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(5))),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const Spacer(),
            const Flexible(child: Text("Code has been sent to +216 223 56* **2", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500))),
            const SizedBox(height: 30),
            IgnorePointer(
              ignoring: true,
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                otpFieldStyle: OtpFieldStyle(borderColor: white, backgroundColor: grey.withOpacity(.3)),
                contentPadding: const EdgeInsets.all(16),
                style: const TextStyle(fontSize: 16),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                controller: _otpController,
                fieldStyle: FieldStyle.box,
                onChanged: (String pin) {
                  _pin = pin;
                  _buttonKey.currentState!.setState(() {});
                },
              ),
            ),
            StatefulBuilder(
              key: _tiktokKey,
              builder: (BuildContext context, void Function(void Function()) _) {
                if (_tiktok == 0) {
                  return const SizedBox();
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Text("Resend code in ${_tiktok}s", style: const TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Password()));
              },
              child: StatefulBuilder(
                key: _buttonKey,
                builder: (BuildContext context, void Function(void Function()) _) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(color: _pin.length == 4 ? pink : grey, borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: const Text("Verify", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
