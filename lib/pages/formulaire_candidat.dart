import 'dart:io';

import 'package:application_vote/common/button_form.dart';
import 'package:application_vote/common/input_form.dart';
import 'package:application_vote/models/candidate.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormulaireCandidat extends StatefulWidget {
  const FormulaireCandidat({super.key});

  @override
  State<FormulaireCandidat> createState() => _FormulaireCandidatState();
}

class _FormulaireCandidatState extends State<FormulaireCandidat> {
  final _formKey = GlobalKey<FormState>();
  final Candidate candidate = Candidate();
  List<File> files = [];

  void takeImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print("Image ${image!.path}");
    var file = File(image.path);
    files.add(file);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un candidat'),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {
                          takeImage();
                        },
                        icon: Icon(Icons.photo)),
                  ),
                ),
                SizedBox(height: 20),
                InputForm(
                  name: 'Nom',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Champ obligatoire";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    candidate.name = value;
                  },
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: 20),
                InputForm(
                  name: 'Prénom',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Champ obligatoire";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    candidate.surname = value;
                  },
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: 20),
                InputForm(
                  name: 'Parti politique',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Champ obligatoire";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    candidate.parti_politique = value;
                  },
                  prefixIcon: Icon(Icons.flag),
                ),
                SizedBox(height: 20),
                InputForm(
                  name: 'Description',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Champ obligatoire";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    candidate.describe = value;
                  },
                  prefixIcon: Icon(Icons.info),
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text("Date de naissance"),
                  subtitle: Text("${candidate.birthdate}"),
                  trailing: Icon(Icons.calendar_month),
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      cancelText: "Annuler",
                      confirmText: "Confirmer",
                      barrierColor: Colors.green.shade50,
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        candidate.birthdate = selectedDate;
                      });
                    }
                  },
                ),
              ]))),
      bottomNavigationBar: BottomAppBar(
        child: ButtonForm(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context, candidate);
            }
          },
          text: 'Se connecter',
        ),
      ),
    );
  }
}













// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:candidate_vote_app/models/candidate.dart';
// import 'package:candidate_vote_app/common/input_form.dart';
// import 'package:candidate_vote_app/common/button_form.dart';
// import 'package:http/http.dart' as http;

// class AddCandidateForm extends StatefulWidget {
//   const AddCandidateForm({super.key});

//   @override
//   State<AddCandidateForm> createState() => _AddCandidateFormState();
// }

// class _AddCandidateFormState extends State<AddCandidateForm> {
//   final _formKey = GlobalKey<FormState>();
//   final Candidate candidate = Candidate();
//   List<Candidate> candidates = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ajouter un candidat'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               InputForm(
//                 name: 'Nom',
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Champ obligatoire";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   candidate.name = value;
//                 },
//                 prefixIcon: Icon(Icons.person),
//               ),
//               SizedBox(height: 20),
//               InputForm(
//                 name: 'Prénom',
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Champ obligatoire";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   candidate.surname = value;
//                 },
//                 prefixIcon: Icon(Icons.person),
//               ),
//               SizedBox(height: 20),
//               InputForm(
//                 name: 'Description',
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Champ obligatoire";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   candidate.describe = value;
//                 },
//               ),
//               SizedBox(height: 20),
//               InputForm(
//                 name: 'Profil URL',
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "Champ obligatoire";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   candidate.profil_image = value;
//                 },
//               ),
//               SizedBox(height: 20),
//               ButtonForm(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {

//                     var url =
//                         Uri.https('jsonplaceholder.typicode.com', '/users');

//                     var response = await http.post(
//                       url,
//                       body: jsonEncode(
//                           candidate.toJson()), // Convertir l'objet en JSON
//                     );

//                     if (response.statusCode == 201) {

//                         _formKey.currentState!.save();
//                       Navigator.pop(context, candidate);
//                     } 
//                     else 
                    
//                     {
//                       // Si la soumission échoue, afficher un message d'erreur
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text('Erreur'),
//                           content: const Text(
//                               'La soumission a échoué. Veuillez réessayer.'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: Text('OK'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 text: "Register as Candidate",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }