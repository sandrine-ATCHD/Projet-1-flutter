import 'package:flutter/material.dart';
import 'package:application_vote/models/candidate.dart';

class DescribeCandidate extends StatefulWidget {
  final Candidate candidate;

  const DescribeCandidate({required this.candidate});

  @override
  State<DescribeCandidate> createState() => _DescribeCandidateState();
}

class _DescribeCandidateState extends State<DescribeCandidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              '${widget.candidate.parti_politique}',
              style: TextStyle(
                color: Colors.teal,
              ),
            ),
            Text(
              '${widget.candidate.name}',
              style: TextStyle(
                fontWeight: FontWeight.w500,

                fontSize: 20.0,
              ),
            ),
            Text(
              'candidat',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20,
                right: 10,
              ),
              width: 500,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Text(
                '${widget.candidate.describe}',
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
