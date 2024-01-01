import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:luxy/utils/globals.dart';
import 'package:path_provider/path_provider.dart';

import '../models/product_model.dart';

void showToast(String message) => Fluttertoast.showToast(msg: message, backgroundColor: pink.withOpacity(.6), fontSize: 16, gravity: ToastGravity.SNACKBAR, toastLength: Toast.LENGTH_LONG, textColor: white);

Future<List<ProductModel>> loadProducts() async => json.decode(await rootBundle.loadString("assets/jsons/products.json")).map((dynamic product) => ProductModel.fromJson(product)).toList().cast<ProductModel>();

Future<bool> load() async {
  try {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    user = await Hive.openBox("user");
    if (user!.isEmpty) {
      await user!.put("dark_mode", true);
      await user!.put("first_time", true);
      await user!.put("remember_me", false);
      await user!.put("language", "en");
      await user!.put("general_notification", false);
      await user!.put("sound", false);
      await user!.put("special_offers", false);
      await user!.put("vibrate", false);
      await user!.put("promote_discount", false);
      await user!.put("payments", false);
      await user!.put("cashback", false);
      await user!.put("app_updates", false);
      await user!.put("new_service_available", false);
      await user!.put("new_tips_available", false);
    }
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDjuWTbysu3xYLXmRwYlVU47b4wgW2vkDA",
        storageBucket: "truck-97497.appspot.com",
        appId: "1:705178287722:android:a39bd5970c6af438c89413",
        messagingSenderId: "705178287722",
        projectId: "truck-97497",
      ),
    );

    return true;
  } catch (e) {
    return false;
  }
}

Duration timeStringToDuration(String timeStr) {
  try {
    final List<String> timeParts = timeStr.split(':');
    final int minutes = int.parse(timeParts[0]);
    final int seconds = int.parse(timeParts[1]);

    return Duration(minutes: minutes, seconds: seconds);
  } catch (e) {
    return const Duration();
  }
}
