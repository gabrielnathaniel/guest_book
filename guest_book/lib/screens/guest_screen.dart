import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../screens/guest_detail_screen.dart';
import '../widgets/main_drawer.dart';

class GuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Guest'),
      ),
      drawer: MainDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('guest')
            .orderBy('date')
            .snapshots(),
        builder: (ctx, guestSnapshot) {
          if (guestSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final guestDocs = guestSnapshot.data.docs;
          return ListView.builder(
            itemCount: guestDocs.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(
                      guestDocs[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                DateFormat.yMMMEd().add_jm().format(
                      guestDocs[index]['date'].toDate(),
                    ),
              ),
              subtitle: Text(guestDocs[index]['occassion']),
              onTap: () {
                Navigator.of(context).pushNamed(
                  GuestDetailScreen.routeName,
                  arguments: guestDocs[index].id,
                );
              },
            ),
          );
        },
      ),
      // const Center(
      //   child: Text('No guest registered yet.'),
      // ),
    );
  }
}
