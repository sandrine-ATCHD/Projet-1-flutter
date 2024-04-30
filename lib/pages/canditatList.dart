import 'package:application_vote/models/candidate.dart';
import 'package:application_vote/pages/describe_candidat.dart';
import 'package:application_vote/pages/formulaire_candidat.dart';
import 'package:flutter/material.dart';

class CandidatList extends StatefulWidget {
  const CandidatList({super.key});

  @override
  State<CandidatList> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<CandidatList> {
  String name = "";
  bool liked = false;
  List<Candidate> candidates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Elections 🇧🇯🇧🇯 ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          SizedBox(
            width: 25,
            height: 20,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.notification_add,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Candidates",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        "${candidates.length} candidates",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: candidates.length,
                  itemBuilder: (context, index) {
                    Candidate candidate = candidates[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescribeCandidate(
                              candidate: candidate,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 80,
                              height: 80,
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${candidate.name} ${candidate.surname}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${candidate.describe} ",
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Candidate candidate = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormulaireCandidat(),
            ),
          );
          if (candidate != null) {
            setState(() => candidates.add(candidate));
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}
