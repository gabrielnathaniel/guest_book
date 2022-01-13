import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/pet_screen.dart';
import 'package:flutter_complete_guide/screens/vehicle_screen.dart';

import '../screens/add_guest_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            // color: Theme.of(context).accentColor,
            child: Text(
              'Occupant Book',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Register Occupant',
            Icons.person_add_alt_1,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(AddGuestScreen.routeName);
            },
          ),
          buildListTile(
            'Occupant List',
            Icons.person,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Vehicle List',
            Icons.car_rental,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(VehicleScreen.routeName);
            },
          ),
          buildListTile(
            'Pet List',
            Icons.pets,
            () {
              Navigator.of(context).pushReplacementNamed(PetScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
