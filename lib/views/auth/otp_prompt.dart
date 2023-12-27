import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';
import 'package:luxy/utils/helpers/button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPPrompt extends StatefulWidget {
  const OTPPrompt({super.key});

  @override
  State<OTPPrompt> createState() => _OTPPromptState();
}

class _OTPPromptState extends State<OTPPrompt> {
  final OtpFieldController _otpController = OtpFieldController();
  final List<IconData> _keyboard = <IconData>[
    FontAwesome.num1_solid,
    FontAwesome.num2_solid,
    FontAwesome.num3_solid,
    FontAwesome.num4_solid,
    FontAwesome.num5_solid,
    FontAwesome.num6_solid,
    FontAwesome.num7_solid,
    FontAwesome.num9_solid,
    FontAwesome.num9_solid,
    FontAwesome.asterisk_solid,
    FontAwesome.num0_solid,
    FontAwesome.x_solid,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        leading: IconButton(
          icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Forgot Password", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const Spacer(),
            const Flexible(child: Text("Code has been sent to +216 223 56* **2", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500))),
            const SizedBox(height: 30),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              otpFieldStyle: OtpFieldStyle(borderColor: white, backgroundColor: grey.withOpacity(.3)),
              contentPadding: const EdgeInsets.all(16),
              style: const TextStyle(fontSize: 16),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              controller: _otpController,
              fieldStyle: FieldStyle.box,
              onCompleted: (String pin) {},
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const OTPPrompt()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: const Text("Verify", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.3)),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: _keyboard.length,
                  itemBuilder: (BuildContext context, int index) => Buttoned(icon: _keyboard[index], text: "", callback: () {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
