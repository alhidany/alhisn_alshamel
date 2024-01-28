import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DBHelper with ChangeNotifier {
  int x = 5;
  //DBHelper();
  DBHelper._();
  static Database? _database;
  static final dbHelper = DBHelper._();
  Future<Database?> get database async {
    print("object+++++");
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future initDB() async {

    io.Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, "areadb.db");

    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      // await db.execute('DROP TABLE IF EXISTS area');
      await db.execute(
          // "CREATE TABLE area(id Integer  Primary key Autoincrement Not null, a float(9,2) ,b float(9,2) ,c float(9,2),total float(9,2),state Integer)");
          "CREATE TABLE area(id Integer  Primary key Autoincrement Not null, Type Integer ,TextOne varchar(250) ,TxtTwo varchar(250),Counter Integer,Fav Integer,ReptTime Integer,RepGroupTime Integer)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "'﴿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيم﴾'"
          ",''"
          ",0,1,21,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "'بِسمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ '"
          ",''"
          ",0,1,7,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "'بِسْمِ اللَّهِ، وَبِاللَّهِ، وَبِأَلْفِ أَلْفِ لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ، تَوَكَّلْتُ عَلَى اللَّهِ، تَدَرَّعْتُ وَتَحَصَّنْتُ بِكَلِمَاتِ اللَّهِ'"
          ",''"
          ",0,1,7,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "'وَحَجَّبْتُ وَحَوَّطْتُ نَفْسِي وَأَهْلِي وَوَلَدِي وَمَالِي وَبَيْتِي وَكُلَّ مُتَعَلَّقَاتِي وَكُلَّ مَنْ لَهُ شَفَقَةٌ فِي قَلْبِي؛ بِحِصْنِ اللَّهِ الْحَصِينِ، وَحِجَابِهِ الْعَظِيمِ، وَسُورِهِ الْمَتينِ الَّذِي لَا يَأْتِيهِ الْبَاطِلُ مِنْ بَيْنِ يَدَيْهِ وَلَا مِنْ خَلْفِهِ، وَلَا عَنْ يَمِينِهِ وَلَا عَنْ شِمَالِهِ، وَلَا مِنْ فَوْقِهِ وَلَا مِنْ تَحْتِهِ، تَنْزِيلٌ مِنْ حَكِيمٍ حَمِيدٍ'"
          ",''"
          ",0,1,1,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "' ﴿اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيم﴾'"
          ",'جُدْرَانُهُ '"
          ",0,1,7,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "'﴿سَلَامٌ قَوْلًا مِّن رَّبٍّ رَّحِيمٍ﴾'"
          ",'سَقْفُهُ'"
          ",0,1,28,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "'﴿وَجَعَلْنَا مِن بَيْنِ أَيْدِيهِمْ سَدًّا وَمِنْ خَلْفِهِمْ سَدًّا فَأَغْشَيْنَاهُمْ فَهُمْ لَا يُبْصِرُونَ﴾'"
          ",'بَابُهُ'"
          ",0,1,21,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(1,"
          "' ﴿حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ﴾'"
          ",'حُرَّاسُهُ'"
          ",0,1,21,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(2,"
          "'بِسْمِ اللَّهِ، وَبِاللَّهِ، وَبِأَلْفِ أَلْفِ لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ، تَوَكَّلْتُ عَلَى اللَّهِ، تَدَرَّعْتُ وَتَحَصَّنْتُ بِكَلِمَاتِ اللَّهِ'"
          ",''"
          ",0,1,10,0)");
      await db.execute("Insert into area(Type  ,TextOne  ,TxtTwo ,Counter ,Fav ,ReptTime,RepGroupTime ) VALUES "
          "(2,"
          "'وَحَجَّبْتُ وَحَوَّطْتُ نَفْسِي وَأَهْلِي وَوَلَدِي وَمَالِي وَبَيْتِي وَكُلَّ مُتَعَلَّقَاتِي وَكُلَّ مَنْ لَهُ شَفَقَةٌ فِي قَلْبِي؛ بِحِصْنِ اللَّهِ الْحَصِينِ، وَحِجَابِهِ الْعَظِيمِ، وَسُورِهِ الْمَتينِ الَّذِي لَا يَأْتِيهِ الْبَاطِلُ مِنْ بَيْنِ يَدَيْهِ وَلَا مِنْ خَلْفِهِ، وَلَا عَنْ يَمِينِهِ وَلَا عَنْ شِمَالِهِ، وَلَا مِنْ فَوْقِهِ وَلَا مِنْ تَحْتِهِ، تَنْزِيلٌ مِنْ حَكِيمٍ حَمِيدٍ'"
          ",''"
          ",0,1,1,0)");

      //NOT NULL AUTO_INCREMENT
    });
  }

  Future insertData({required String tableName, model}) async {
    final db = await database;
    db?.insert(tableName, model);
  }

  Future updateData({required String tableName, model, id}) async {
    final db = await database;
    db?.update(tableName, model, where: 'id=?', whereArgs: [id]);
  }

  Future updateDataWhenComplaate({required String tableName, model, type}) async {
    final db = await database;
    db?.update(tableName, model, where: 'Type=?', whereArgs: [type]);
  }

  Future selectData({required String tableName}) async {
    final db = await database;
    var result = await db?.rawQuery("Select * from $tableName");
    if (result != null) {
      return result;
    } else {
      return "No Data---<>>>>>";
    }
  }

  Future selectSpecifcdata({required String tableName, required String id}) async {
    final db = await database;
    var result = await db?.rawQuery("Select * from $tableName where Type= $id");
    if (result != null) {
      return result;
    } else {
      return "No Data---<>>>>>";
    }
  }

  Future selectTotal({required String tableName}) async {
    final db = await database; //,count([price]) as counter
    var result = await db?.rawQuery("select sum([total]) as total from $tableName ");
    if (result != null) {
      return result;
    } else {
      return 0;
    }
  }

  Future deletOneRowFromAnyTable({required String tableName, required String id}) async {
    final db = await database; //,count([price]) as counter
    var result = await db?.rawDelete("DELETE from $tableName where id= $id");
    return "Delete data from data base>>$result";
  }

  Future deletallRowFromAnyTable({required String tableName}) async {
    final db = await database; //,count([price]) as counter
    var result = await db?.rawDelete("DELETE from $tableName");
    return "Delete data from data base>>$result";
  }
}
