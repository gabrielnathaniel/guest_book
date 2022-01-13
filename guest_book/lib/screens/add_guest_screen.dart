import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/main_drawer.dart';
import '../widgets/guest_form.dart';

class AddGuestScreen extends StatelessWidget {
  static const routeName = '/add-guest';

  void _submitGuestForm(
    String name,
    String email,
    String information,
    String vehicle,
    String pet,
    // File image,
  ) {
    FirebaseFirestore.instance.collection('guest').add({
      'name': name,
      'email': email,
      'information': information,
      'vehicle': vehicle,
      'pet': pet,
      'date': DateTime.now(),
      // 'image': image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Guest'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: GuestForm(_submitGuestForm),
      ),
    );
  }
}
