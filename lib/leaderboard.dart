import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:name/people.dart';

CollectionReference leadInfo =
    FirebaseFirestore.instance.collection('LeaderboardInfo');

Future<List<Person>>? getNames() async {
  List<Person> ret = [];
  await leadInfo.get().then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      // assert(doc.data().toString().contains('wins'));
      var email = doc['email'];
      var wins = doc['wins'];
      var losses = doc['losses'];
      ret.add(Person(email: email, wins: wins, losses: losses));
    });
  });
  ret.sort((a, b) {
    double winPercentageA = a.wins.toDouble();
    if (a.wins + a.losses != 0) winPercentageA /= (a.wins + a.losses).toDouble();
    double winPercentageB = b.wins.toDouble();
    if (b.wins + b.losses != 0) winPercentageB /= (b.wins + b.losses).toDouble();
    return -1 * winPercentageA.compareTo(winPercentageB);

  });
  return ret;
}

class Leaderboard extends StatelessWidget {
  String str(int index) {
    return (index + 1).toString();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: FutureBuilder<List<Person>>(
        future: getNames(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(child: ListTile(
                  leading: Text(
                    str(index)
                  ),
                  title: Text(snapshot.data![index].email),
                  trailing: Text('Win %: ' + get_stuff(snapshot.data![index])),
                ));
              },
            );
          } else {
            return const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  String get_stuff(Person P) {
    if (P.wins + P.losses == 0) return '0';
    else return (P.wins.toDouble() / (P.wins + P.losses).toDouble()).toString();
  }
}
