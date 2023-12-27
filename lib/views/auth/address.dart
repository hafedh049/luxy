import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luxy/utils/globals.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final TextEditingController _localisationController = TextEditingController();
  final GlobalKey<State> _governorateKey = GlobalKey<State>();

  @override
  void dispose() {
    _localisationController.dispose();
    super.dispose();
  }

  final List<String> _tunisianGovernorates = <String>['Tunis', 'Ariana', 'Ben Arous', 'Manouba', 'Nabeul', 'Zaghouan', 'Bizerte', 'Béja', 'Jendouba', 'Kef', 'Siliana', 'Kairouan', 'Kasserine', 'Sidi Bouzid', 'Sousse', 'Monastir', 'Mahdia', 'Sfax', 'Gafsa', 'Tozeur', 'Kebili', 'Gabès', 'Medenine', 'Tataouine'];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: dark,
          leading: IconButton(
            icon: const Icon(FontAwesome.chevron_left_solid, size: 15, color: white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Add your address", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Address Details", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
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
                    suffix: Icon(Bootstrap.pin_map, size: 15, color: grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                                        separatorBuilder: (context, index) => Container(
                                          width: MediaQuery.sizeOf(context).width,
                                        ),
                                        itemBuilder: (BuildContext context, int index) => GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                                            child: const Text("Phone Number", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
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
              const SizedBox(height: 30),
              const Text("Phone Number", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: grey.withOpacity(.2)),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                    hintText: "Gouvernement",
                    hintStyle: TextStyle(color: grey),
                    suffixIcon: Icon(FontAwesome.chevron_down_solid, size: 15, color: grey),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: const Text("Skip", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(color: pink, borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: const Text("Continue", style: TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
