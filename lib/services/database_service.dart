import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class LocalDatabaseService {
  LocalDatabaseService._();
  static LocalDatabaseService _instance;

  Database _db;
  final store = StoreRef.main();

  static Future<LocalDatabaseService> getInstance() async {
    if(_instance == null) {
      _instance = LocalDatabaseService._();
      await _instance._openDatabase();
    }
    return _instance;
  }

  Future<void> _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'MyMoney.db');
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> put(String key, dynamic value) async {
    try {
      await store.record(key).put(_db, value);
    } catch (e) {
      print('[LocalDatabaseService][put] $e');
    }
  }

  Future<dynamic> get(String key) async {
    try {
      return await store.record(key).get(_db);
    } catch (e) {
      print('[LocalDatabaseService][get] $e');
    }
  }

  Future<void> delete(String key) async {
    try {
      await store.record(key).delete(_db);
    } catch (e) {
      print('[LocalDatabaseService][delete] $e');
    }
  }

  Future<void> append(String key, dynamic value) async {
    try {
      final result = (await get(key));
      final list = ((result ?? []) as List).toList(growable: true);
      list.add(value);
      await put(key, list);
    } catch (e) {
      print('[LocalDatabaseService][append] $e');
    }
  }

  Future<void> removeFromList(String key, bool Function(dynamic) where) async {
    try {
      final result = (await get(key));
      final list = ((result ?? []) as List).toList(growable: true);
      list.removeWhere(where);
      await put(key, list);
    } catch (e) {
      print('[LocalDatabaseService][removeFromList] $e');
    }
  }


  Future<void> close() async {
    await _db.close();
  }
}