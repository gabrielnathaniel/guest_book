import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './add_image.dart';

class GuestForm extends StatefulWidget {
  GuestForm(this.submitFn);

  final void Function(
    String name,
    String email,
    String information,
    String vehicle,
    String pet,
    // File image,
  ) submitFn;

  @override
  _GuestFormState createState() => _GuestFormState();
}

class _GuestFormState extends State<GuestForm> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _userEmail = '';
  String _userInformation = '';
  String _userVehicle = '';
  String _userPet = '';
  // File _userImage;

  // void _pickedImage(File image) {
  //   _userImage = image;
  // }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    // if (_userImage == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Please pick an image.'),
    //       backgroundColor: Theme.of(context).errorColor,
    //     ),
    //   );
    //   return;
    // }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userName.trim(),
        _userEmail.trim(),
        _userInformation.trim(),
        _userVehicle.trim(),
        _userPet.trim(),
        // _userImage,
      );
      Navigator.of(context).pushNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // AddImage(_pickedImage),
                TextFormField(
                  key: ValueKey('name'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 3) {
                      return 'Please enter at least 3 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  onSaved: (value) {
                    _userEmail = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('information'),
                  validator: (value) {
                    if (value.isEmpty || value.length < 3) {
                      return 'Please enter at least 3 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Information',
                  ),
                  onSaved: (value) {
                    _userInformation = value;
                  },
                ),
                TextFormField(
                  key: ValueKey('vehicle'),
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Vehicle (optional)',
                  ),
                  onSaved: (value) {
                    if (value.isEmpty) {
                      _userVehicle = 'No Vehicle';
                    } else {
                      _userVehicle = value;
                    }
                  },
                ),
                TextFormField(
                  key: ValueKey('pet'),
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Pet (optional)',
                  ),
                  onSaved: (value) {
                    if (value.isEmpty) {
                      _userPet = 'No Pet';
                    } else {
                      _userPet = value;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: _trySubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
