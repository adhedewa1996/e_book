import 'package:e_books/data/sources/favorite.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveServices {
  Future<void> init() async {}
}

class HiveServicesImpl extends HiveServices {
  @override
  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await FavoriteServicesImpl().register();
  }
}
