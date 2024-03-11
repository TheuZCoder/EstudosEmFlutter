
import 'package:app_animais/model.dart';

class AnimalController {
  //attributos    
  List<Animal> _listAnimal = [];

  //
  List<Animal> get listarAnimais => _listAnimal;

  //adicionar animal

  void adicionarAnimal(especie, urlFoto, urlAudio){
    Animal novoAnimal = Animal(especie, urlFoto, urlAudio);
    _listAnimal.add(novoAnimal);
  }
}