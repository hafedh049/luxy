import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../utils/globals.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final TextEditingController _localisationController = TextEditingController();
  final GlobalKey<State> _governorateKey = GlobalKey<State>();

  @override
  void dispose() {
    _localisationController.dispose();
    super.dispose();
  }

  String _governorate = 'Tunis';
  final List<String> _tunisianGovernorates = <String>['Tunis', 'Ariana', 'Ben Arous', 'Manouba', 'Nabeul', 'Zaghouan', 'Bizerte', 'Béja', 'Jendouba', 'Kef', 'Siliana', 'Kairouan', 'Kasserine', 'Sidi Bouzid', 'Sousse', 'Monastir', 'Mahdia', 'Sfax', 'Gafsa', 'Tozeur', 'Kebili', 'Gabès', 'Medenine', 'Tataouine'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: dark,
          leading: IconButton(icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white), onPressed: () => Navigator.pop(context)),
          actions: <Widget>[IconButton(icon: const Icon(FontAwesome.ellipsis_solid, size: 15, color: white), onPressed: () {})],
          title: const Text("Add New Address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Divider(thickness: .5, height: .5, color: grey),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Address Details", style: TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    const Divider(thickness: .5, height: .5, color: grey),
                    const SizedBox(height: 10),
                    const Text("Address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                      child: TextField(
                        controller: _localisationController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Location",
                          hintStyle: TextStyle(color: grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("City", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                      child: TextField(
                        controller: _localisationController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Governorate",
                          hintStyle: const TextStyle(color: grey),
                          suffixIcon: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                  height: MediaQuery.sizeOf(context).height * .3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                                        child: TextField(
                                          controller: _localisationController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(16),
                                            border: InputBorder.none,
                                            hintText: "Gouvernement",
                                            hintStyle: TextStyle(color: grey),
                                            suffixIcon: Icon(FontAwesome.chevron_down_solid, size: 15, color: grey),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: StatefulBuilder(
                                          key: _governorateKey,
                                          builder: (BuildContext context, void Function(void Function()) _) {
                                            final List<String> tempo = _tunisianGovernorates.where((String element) => element.startsWith(_localisationController.text.trim())).toList();
                                            return ListView.separated(
                                              itemCount: tempo.length,
                                              padding: EdgeInsets.zero,
                                              separatorBuilder: (BuildContext context, int index) => Container(width: MediaQuery.sizeOf(context).width, height: .5, color: grey),
                                              itemBuilder: (BuildContext context, int index) => GestureDetector(
                                                onTap: () {
                                                  if (_governorate != tempo[index]) {
                                                    _governorate = tempo[index];
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(8),
                                                  margin: const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: _governorate == tempo[index] ? pink : grey.withOpacity(.2)),
                                                  child: Text(tempo[index], style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Bootstrap.pin_map, size: 15, color: grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Phone Number", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                      child: InternationalPhoneNumberInput(
                        selectorButtonOnErrorPadding: 4,
                        spaceBetweenSelectorAndTextField: 0,
                        selectorConfig: const SelectorConfig(
                          leadingPadding: 16,
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          trailingSpace: false,
                          useBottomSheetSafeArea: true,
                          useEmoji: true,
                          showFlags: true,
                          setSelectorButtonAsPrefixIcon: true,
                        ),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: pink,
                        errorMessage: "Wrong phone number format",
                        hintText: "+216 23 566 502",
                        searchBoxDecoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Choose your country",
                          hintStyle: TextStyle(color: grey),
                        ),
                        inputDecoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Number",
                          hintStyle: TextStyle(color: grey),
                        ),
                        onInputChanged: (PhoneNumber value) {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                      child: TextField(
                        controller: _localisationController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Meta data",
                          hintStyle: TextStyle(color: grey),
                          suffixIcon: Icon(Bootstrap.pin_map, size: 15, color: grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Continue", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
