import 'package:hive/hive.dart';
import 'package:luxy/utils/globals.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> load() async {
  try {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    user = await Hive.openBox("user");
    if (user.isEmpty) {
      await user.put("dark_mode", true);
      await user.put("first_time", true);
      await user.put("language", "en");
    }
    return true;
  } catch (e) {
    return false;
  }
}
