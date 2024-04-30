class Candidate {
  String? name;
  String? surname;
  String? parti_politique;
  String? describe;
  DateTime? birthdate;
  

  Candidate({this.name, this.surname,this.parti_politique, this.describe, this.birthdate});

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname, , parti_politique: $parti_politique, describe: $describe, birthdate: $birthdate}';
  }



}