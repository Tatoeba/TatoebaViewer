import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final Future<Database> database = openDatabase(
    // Set the path to the database.
    join(await getDatabasesPath(), 'local.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE favorites(id INTEGER PRIMARY KEY, json_data TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return database;
}

class Favorite {
  final int id;
  final String jsonData;

  Favorite({this.id, this.jsonData});

  // Convert a Favorite into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'json_data': jsonData,
    };
  }

  // Define a function that inserts dogs into the database
  Future<void> insert() async {
    // Get a reference to the database.
    final Database db = await getDatabase();

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'favorites',
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  static Future<List<Favorite>> favorites() async {
    // Get a reference to the database.
    final Database db = await getDatabase();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Favorite(
        id: maps[i]['id'],
        jsonData: maps[i]['json_data'],
      );
    });
  }

  Future<void> delete() async {
    // Get a reference to the database.
    final db = await getDatabase();

    // Remove the Dog from the Database.
    await db.delete(
      'favorites',
      // Use a `where` clause to delete a specific fav.
      where: "id = ?",
      // Pass the Fav's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

}

