import 'package:exercicioflutter/person.dart';
import 'package:flutter/material.dart';
import 'person_tile.dart';

class PersonTable extends StatefulWidget {
  @override
  _PersonTableState createState() => _PersonTableState();
}

class _PersonTableState extends State<PersonTable> {
  List<Person> people = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return PersonTile(person: people[index]);
      },
    );
  }

  void addPerson(Person? person) {
    if (person != null) {
      setState(() {
        people.add(person);
      });
    }
  }
}
