import 'package:flutter/material.dart';
import '../screens/profile.dart';
import '../screens/home.dart';
import '../screens/fillform.dart';
import '../screens/savedforms.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Jump To...'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(Home.routeName);
                      }),
                  SizedBox(width: 5),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(Home.routeName);
                      },
                      child: Text('Home page',
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 17))),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(FillForm.routeName)
                            .then((onValue) {
                          if (onValue == true) Navigator.of(context).pop();
                        });
                      }),
                  SizedBox(width: 5),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(FillForm.routeName)
                            .then((onValue) {
                          print(onValue);
                          if (onValue == true) Navigator.of(context).pop();
                        });
                      },
                      child: Text('Lead Data Entry',
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 17))),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.save_alt),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(FillForm.routeName);
                      }),
                  SizedBox(width: 5),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(SavedForms.routeName);
                      },
                      child: Text('Saved Forms',
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 17))),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(Profile.routeName);
                      }),
                  SizedBox(width: 5),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(Profile.routeName);
                      },
                      child: Text('Profile',
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 17))),
                ],
              ),
              SizedBox(height: 5),
             Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.exit_to_app),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Provider.of<Auth>(context, listen: false).logout();
                      }),
                  SizedBox(width: 5),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Provider.of<Auth>(context, listen: false).logout();
                      },
                      child: Text('Logout',
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 17))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
