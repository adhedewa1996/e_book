import 'package:e_books/data/repositories/favorite.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveServices {
  static Future<void> init() async {}
}

class HiveServicesImpl extends HiveServices {
  static Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await FavoriteRepositoryImpl().register();
  }
}
