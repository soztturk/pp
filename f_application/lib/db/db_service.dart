import 'package:f_application/model/mobilSetting.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class IDbMobilSettings {
  Future<bool> insertMobilSetting(MobilSetting model);
  Future<MobilSetting?> readMobilSettingItem(int id);
  Future<List> getMobilSettings();
  Future<bool> updateMobilSetting(MobilSetting model);
  Future<bool> deleteMobilSetting(int id);
  Future<void> close();
}

class DbMobilSettings extends IDbMobilSettings {
  static Database? _database;
  String _databaseName = "kisi";
  String _tableNameMobilSettings = "MobilSettings";
  int _version = 2;

  String _colId = "Id";
  String _adSoyad = "AdSoyad";
  String _telefon = "Telefon";
  String _yas = "Yas";
  String _eMail = "EMail";
  String _sehir = "Sehir";

  static final DbMobilSettings instance = DbMobilSettings._init();
  DbMobilSettings._init();
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initialDatabase();
    }
    return _database;
  }

  Future<Database?> initialDatabase() async {
    String dbPath = join(await getDatabasesPath(), _databaseName);
    var mobilSettingDB = await openDatabase(
      dbPath,
      version: _version,
      onCreate: _createTable,
    );
    return mobilSettingDB;
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "$_tableNameMobilSettings" (
	"$_colId"	INTEGER NOT NULL,
	"$_adSoyad"	TEXT,
	"$_telefon"	TEXT,
	"$_yas"	TEXT,
	"$_eMail"	TEXT,
	"$_sehir"	TEXT,
	PRIMARY KEY("$_colId" AUTOINCREMENT)
)
  ''');
  }

  @override
  Future<bool> insertMobilSetting(MobilSetting model) async {
    Database? db = await this.database;
    final mobilActionMaps = db?.insert(
      _tableNameMobilSettings,
      model.toObject(),
    );
    return mobilActionMaps != null;
  }

  @override
  Future<List> getMobilSettings() async {
    Database? db = await this.database;
    var result = await db!.rawQuery("Select * from $_tableNameMobilSettings");
    return result;
  }

  @override
  Future<MobilSetting?> readMobilSettingItem(int id) async {
    Database? db = await this.database;
    final passwordMaps = await db?.query(
      _tableNameMobilSettings,
      where: '$_colId = ?',
      whereArgs: [id],
    );

    if (passwordMaps!.isNotEmpty) {
      return MobilSetting.fromObject(passwordMaps.first);
    } else {
      return null;
    }
  }

  @override
  Future<bool> updateMobilSetting(MobilSetting model) async {
    Database? db = await this.database;

    final passwordMaps = await db?.update(
      _tableNameMobilSettings,
      model.toObject(),
      where: '$_colId = ?',
      whereArgs: [model.id],
    );

    return passwordMaps != null;
  }

  @override
  Future<bool> deleteMobilSetting(int id) async {
    Database? db = await this.database;

    final userMaps = await db?.delete(
      _tableNameMobilSettings,
      where: '$_colId = ?',
      whereArgs: [id],
    );
    return userMaps != null;
  }

  @override
  Future<void> close() async {
    Database? db = await this.database;
    await db?.close();
  }
}
