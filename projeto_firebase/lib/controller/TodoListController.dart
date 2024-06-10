import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_firebase/model/TodolistModel.dart';

class TodoListController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;

  //classe firebase firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //metodos 
  //add
  Future<void> addTarefa(Todolist todolist) async {
    try {
      await _firestore.collection('todolist').add(todolist.toMap());
    } catch (e) {
      print(e);
    }
  }

  //deletar
  Future<void> deleteTarefa(String id) async {
    try {
      await _firestore.collection('todolist').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  //listar
 Future<List<Todolist>> listarTarefa(String userId) async {
  final snapshot = await _firestore
    .collection('todolist')
    .where('userId', isEqualTo: userId)
    .orderBy('timestamp', descending: true)
    .get();

  _list = snapshot.docs.map((e) => 
  Todolist.fromJson(e.data())).toList();
  return _list;
 }
}