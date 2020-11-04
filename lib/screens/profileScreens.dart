import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Profile.dart';
import 'package:shopapp/widgets/clipper/ProfileCliper.dart';
import 'package:shopapp/widgets/drowerPage.dart';

class ProfileScreens extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  static const routeName = "/profile-screens";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileData>(context).user;
    return Scaffold(
      key: _globalKey,
      drawer: DrowerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: ProfileCliper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height / 2.5,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    image: AssetImage(user.backgroundImage),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4.0,
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
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      _globalKey.currentState.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Products Add: ${user.productAdd}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Orded: ${user.orderd}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Product You Aded",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
