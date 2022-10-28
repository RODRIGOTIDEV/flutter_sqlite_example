import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sqlite_example/database/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _database();
  }

  Future<void> _database() async {
    final database = await DatabaseSqLit().openConnection();
    // database.insert('teste', {'nome': 'rodrigo'});
    // // database.delete('test', where: 'nome = ?', whereArgs: ['rodrigo']);
    // database.update('teste', {'nome': ' diego'},
    //     where: 'nome = ?', whereArgs: ['rodrigo']);

    database.rawInsert('insert into teste values(null, ?)', ['rodrigo']);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
    );
  }
}
