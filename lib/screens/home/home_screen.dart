import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/menu_state.dart';
import 'widgets/cashback.dart';
import 'widgets/categories.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/popular_products.dart';
import 'widgets/special_offers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getSavedData();
    saveData();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CustomAppBar(),
              CashBack(),
              Categories(),
              SpecialOffers(),
              PopularProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  void getSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    final String variable = prefs.getString('variable') ?? "No data yet";
    debugPrint("Value is: $variable");
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('variable', "omar");
    debugPrint("Value saved");
  }
}

/////// database_helper.dart
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

// class DatabaseHelper {
//   static const _databaseName = "MyDatabase.db";
//   static const _databaseVersion = 1;

//   static const table = 'my_table';

//   static const columnId = '_id';
//   static const columnName = 'name';
//   static const columnAge = 'age';

//   late Database _db;

//   // this opens the database (and creates it if it doesn't exist)
//   Future<void> init() async {
//     final documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, _databaseName);
//     _db = await openDatabase(
//       path,
//       version: _databaseVersion,
//       onCreate: _onCreate,
//     );
//   }

//   // SQL code to create the database table
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId INTEGER PRIMARY KEY,
//             $columnName TEXT NOT NULL,
//             $columnAge INTEGER NOT NULL
//           )
//           ''');
//   }

//   // Helper methods

//   // Inserts a row in the database where each key in the Map is a column name
//   // and the value is the column value. The return value is the id of the
//   // inserted row.
//   Future<int> insert(Map<String, dynamic> row) async {
//     return await _db.insert(table, row);
//   }

//   // All of the rows are returned as a list of maps, where each map is
//   // a key-value list of columns.
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     return await _db.query(table);
//   }

//   // All of the methods (insert, query, update, delete) can also be done using
//   // raw SQL commands. This method uses a raw query to give the row count.
//   Future<int> queryRowCount() async {
//     final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
//     return Sqflite.firstIntValue(results) ?? 0;
//   }

//   // We are assuming here that the id column in the map is set. The other
//   // column values will be used to update the row.
//   Future<int> update(Map<String, dynamic> row) async {
//     int id = row[columnId];
//     return await _db.update(
//       table,
//       row,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }

//   // Deletes the row specified by the id. The number of affected rows is
//   // returned. This should be 1 as long as the row exists.
//   Future<int> delete(int id) async {
//     return await _db.delete(
//       table,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }
// }



////// main.dart
// import 'package:flutter/material.dart';
// import 'database_helper.dart';

// // Here we are using a global variable. You can use something like
// // get_it in a production app.
// final dbHelper = DatabaseHelper();

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // initialize the database
//   await dbHelper.init();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SQFlite Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('sqflite'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _insert,
//               child: const Text('insert'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _query,
//               child: const Text('query'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _update,
//               child: const Text('update'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _delete,
//               child: const Text('delete'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Button onPressed methods

//   void _insert() async {
//     // row to insert
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnName: 'Jilali',
//       DatabaseHelper.columnAge: 23
//     };
//     final id = await dbHelper.insert(row);
//     debugPrint('inserted row id: $id');
//   }

//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     debugPrint('query all rows:');
//     for (final row in allRows) {
//       debugPrint(row.toString());
//     }
//   }

//   void _update() async {
//     // row to update
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnId: 3,
//       DatabaseHelper.columnName: 'Lhssn'
//     };
//     final rowsAffected = await dbHelper.update(row);
//     debugPrint('updated $rowsAffected row(s)');
//   }

//   void _delete() async {
//     // Assuming that the number of rows is the id for the last row.
//     final count = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(count);
//     debugPrint('deleted $rowsDeleted row(s): row $count');
//   }
// }
