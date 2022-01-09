import 'dart:async';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';


class Dog {
  var id = 0;
  var name = '';
  var age = 0;

  Dog(this.id, this.name, this.age);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

class TelaTesteDogs extends StatelessWidget {
  const TelaTesteDogs({Key? key}) : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }

  @override
  Widget build(BuildContext context) {
    Dog doggo = Dog(0, 'test', 0);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // for (int i = 0; i < 100; i++) {
    //   insertDog(Dog(id: i, name: 'test', age: Random().nextInt(1000) + 1));
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            FlatButton(
              onPressed: () => getDog(),
              child: const Text('test'),
              color: Colors.grey,
            ),
            FormText(
              saveFunction: (value) {
                doggo.id = int.parse(value);
              },
              title: 'ID',
              mandatoryField: true,
            ),
            FormText(
              saveFunction: (value) {
                doggo.name = value;
              },
              title: 'NAME',
              mandatoryField: true,
            ),
            FormText(
              saveFunction: (value) {
                doggo.age = int.parse(value);
              },
              title: 'AGE',
              mandatoryField: true,
            ),
            FlatButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  doggo = Dog(0, '', 0);
                  formKey.currentState!.save();

                  insertDog(doggo);
                }
              },
              child: const Text('Adicionar'),
              color: Colors.grey,
            ),
            FutureBuilder(
              future: getDogsWidget(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Dog>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dog = snapshot.data![index];
                      return getDogCard(dog);
                    },
                  );
                } else {
                  return const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child:  CircularProgressIndicator(),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<List<Dog>> getDogsWidget() async {
  final db = await DatabaseLocal.getDatabase();
  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dogs');
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      maps[i]['id'],
      maps[i]['name'],
      maps[i]['age'],
    );
  });
}

Widget getDogCard(Dog dog) {
  return Card(
    child: Row(
      children: [
        const Icon(
          Icons.person_outline,
          size: 32,
        ),
        Column(
          children: [
            Text(
              dog.name + ', ' + dog.id.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Age: ' + dog.age.toString())
          ],
        )
      ],
    ),
  );
}

Future<void> insertDog(Dog dog) async {
  final db = await DatabaseLocal.getDatabase();

  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

void getDog() async {
  final db = await DatabaseLocal.getDatabase();

  Future<List<Dog>> dogs() async {
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(maps[i]['id'], maps[i]['name'], maps[i]['age']);
    });
  }

  List<Dog> dogList = await dogs();

  int size = dogList.length;

  if (size > 0) {
    // print(dogList.first);
  }
}

Future<void> updateDog(Dog dog) async {
  final db = await DatabaseLocal.getDatabase();
  await db.update(
    'dogs',
    dog.toMap(),
    where: 'id = ?',
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id) async {
  final db = await DatabaseLocal.getDatabase();
  await db.delete(
    'dogs',
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
