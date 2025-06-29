import 'package:e_books/data/sources/favorite.dart';
import 'package:e_books/data/sources/recently_read.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveServices {
  Future<void> init() async {}
}

class HiveServicesImpl extends HiveServices {
  @override
  Future<void> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter();
    Hive.registerAdapter(BookEntityAdapter());
    await FavoriteServicesImpl().register();
    await RecentlyReadServicesImpl().register();
  }
}
