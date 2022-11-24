import 'package:sqflite/sqflite.dart';

import 'local_item_model.dart';
class LocalDatabase{
  static String tablename="myCart";
  static LocalDatabase getInstance=LocalDatabase._init();

  Database? _database;
  LocalDatabase._init();


  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDb("Cart.db");
      return _database!;
    }
    return _database!;
  }


  Future <Database> _initDb(String fileName) async{
    var dbPath=await getDatabasesPath();
    String path=dbPath+fileName;

    Database database=await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
          String textType = "TEXT";
          String intType = "INTEGER";
          String boolType = "INTEGER";
          await db.execute('''
      Create table $tablename(
            _id $idType,
            id $intType,
            count $intType,
            category_id $intType,
            name $textType,
            price $intType,
            image_url $textType,
            description $textType
      )
      ''');
        }
    );
    return database;
  }


  static Future<Product> insertToDatabase(Product product) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tablename, product.toJson());
    return product.copyWith(id: id);


  }

  static Future<List<Product>> getList() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tablename, columns: [
      "_id",
      "count",
      "category_id",
      "id" ,
      "name" ,
      "price" ,
      "image_url" ,
      "description"
    ]);
    List <Product> list =listOfTodos.map((e) => Product.fromJson(e)).toList();


    return list;
  }

  static Future<Product> updateTaskById(Product product) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tablename,
      product.toJson(),
      where: 'name = ?',
      whereArgs: [product.name],
    );
    return product.copyWith(databaseid: id);
  }

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tablename,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  static Future<int> delete() async {

    var database = await getInstance.getDb();
    return await database.delete("myCart");
  }

}