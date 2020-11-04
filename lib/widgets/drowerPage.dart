import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Profile.dart';
import 'package:shopapp/screens/HomeScreens.dart';
import 'package:shopapp/screens/ProfileScreens.dart';
import 'package:shopapp/screens/orderViewScreens.dart';

import 'clipper/DrawerCliper.dart';

class DrowerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileData>(context).user;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: DrawerCliper(),
                  child: Image(
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    image: AssetImage(user.backgroundImage),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(user.image),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreens.routeName);
              },
              leading: Text("Home"),
              title: Icon(Icons.home),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProfileScreens.routeName);
              },
              leading: Text("Profile"),
              title: Icon(Icons.account_box),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderViewscreens.routeName);
              },
              leading: Text("Orders"),
              title: Icon(Icons.download_sharp),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Text("Settings"),
              title: Icon(Icons.settings),
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Text("Logout"),
                  title: Icon(Icons.logout),
                ),
              ),
            ),
            Divider(),
            Divider(),
          ],
        ),
      ),
    );
  }
}
